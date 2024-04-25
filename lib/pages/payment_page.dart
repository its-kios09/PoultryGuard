import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:poultryguard/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/cart_items.dart';
import '../models/poultryshopmodel.dart';
import 'DeliveryProgressPage.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double calculateTotalAmount(List<CartItem> cartItems) {
    double totalAmount = 0;
    for (var item in cartItems) {
      totalAmount += item.totalPrice;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = Provider.of<Shop>(context, listen: false)
        .cart
        .fold(0, (total, cartItem) => total + cartItem.totalPrice);
    List<CartItem> cartItems =
        Provider.of<Shop>(context, listen: false).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text(
            "Processing your payment",
            style: TextStyle(fontFamily: "JosefinSans", fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Image(
                  image: AssetImage("assets/images/logo/app_logo.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dear Customer, Your total bill is:- $totalPrice",
                    style: TextStyle(
                        fontFamily: "JosefinSans",
                        fontSize: 16,
                        color: Theme.of
                          (context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      onTap: (){
                        makePayment(totalPrice.toString(), "USD");
                      }, text: "Pay Now $totalPrice")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Map<String, dynamic>? paymentIntentData;
  Future<void> makePayment(String amount, String currency) async{
      try{
        final int amountInCents = calculateAmount(amount);
        paymentIntentData = await createPaymentIntent(amountInCents.toString(), currency);
        if(paymentIntentData !=null){
          await Stripe.instance.initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
                  merchantDisplayName: "Poultry Guard",
                  customerId: paymentIntentData!['customer'],
                  paymentIntentClientSecret: paymentIntentData!['client_secret'],
                  customerEphemeralKeySecret: paymentIntentData!['ephemeralKey']
              )
          );
          displayPaymentSheet();
          // Delay navigation to DeliveryProgressPage after payment sheet is initialized
          await Future.delayed(const Duration(seconds: 18)); // Adjust delay time as needed

          // Navigate to DeliveryProgressPage
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryProgressPage()));

          // Delay clearing the cart after navigating to DeliveryProgressPage
          await Future.delayed(const Duration(minutes: 5)); // Adjust delay time as needed

          // Clear cart
          Provider.of<Shop>(context, listen: false).clearCart();
        }

      }catch(e,s){
          print("EXCEPTION === $e$s");
      }
  }
  createPaymentIntent(String amount, String currency)async{
    try{
        Map<String, dynamic> body={
          'amount': amount,
          'currency': currency,
          'payment_method_types[]':'card'
        };
        final secretKey = dotenv.env["STRIPE_SECRET_KEY"]!;
        var response = await http.post(Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
          headers: {
            "Authorization": "Bearer $secretKey",
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        );
        return jsonDecode(response.body);
    }catch(err){
      print("err charging user $err");
    }
  }

  void displayPaymentSheet()async {
    try{
        await Stripe.instance.presentPaymentSheet();
        const SnackBar(
          content: Text('Yay! Your payment has been paid successfully',style: TextStyle(
              fontFamily: "JosefinSans", fontSize: 16),),
        );
    }on Exception catch(e){
      if(e is StripeException){
        print("error from stripe $e");
      }else{
        print("Unforeseen error $e");
      }
    }catch(e){
      print("expection====$e");
    }
  }

  int calculateAmount(String amount) {
    final double amountDouble = double.parse(amount);
    final int amountInCents = (amountDouble * 100).toInt();
    return amountInCents;
  }
}
