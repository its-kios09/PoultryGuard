import 'package:flutter/material.dart';
import 'package:poultryguard/widgets/custom_receipt.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delivery in progress...",
          style: TextStyle(fontFamily: "JosefinSans"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [CustomReceipt()],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fredrick Kioko",
                style: TextStyle(
                    fontFamily: "JosefinSans",
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                "Driver",
                style: TextStyle(
                    fontFamily: "JosefinSans",
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    _sendMessage();
                  },
                  icon: const Icon(Icons.message),
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    _makePhoneCall('+25479166087');
                  },
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendMessage() async {
    final url = Uri.parse('sms:+25479166087');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
