import 'package:flutter/material.dart';
import 'package:poultryguard/widgets/custom_receipt.dart';

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
        children: [
          CustomReceipt()
        ],
      ),
    );
  }
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            padding: const EdgeInsets.all(25),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(width: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fredrick Kioko",
                style: TextStyle(
                    fontFamily: "JosefinSans",
                    fontSize: 18,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              Text(
                "Poultry Guard Driver",
                style: TextStyle(
                    fontFamily: "JosefinSans",
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.message),
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                padding: const EdgeInsets.all(25),
                child: IconButton(
                  onPressed: (){},
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
}
