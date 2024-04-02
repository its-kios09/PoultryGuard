import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomCurrentLocation extends StatelessWidget {
  const CustomCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Your current location",
      style: TextStyle(
        fontFamily: "JosefinSans",
        fontSize: 16
      ),),
      content: TextField(decoration: InputDecoration(hintText: "Search address....",
        hintStyle: const TextStyle(fontFamily:"JosefinSans"),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      ),
      actions: [
        MaterialButton(onPressed: ()=> Navigator.pop(context),
          child: const Text("Cancel",
            style: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 16
            ),
          ),
        ),
        MaterialButton(onPressed: ()=> Navigator.pop(context),
          child: const Text("Save location",
            style: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 16
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Deliver Now",
            style: TextStyle(
              fontFamily: "JosefinSans",
                fontWeight: FontWeight.bold

            ),
          ),
          GestureDetector(
            onTap: ()=> openLocationSearchBox(context),
            child: const Row(
              children: [
                Text("Kenya, Nairobi",
                style: TextStyle(
                fontFamily: "JosefinSans",
                ),
                ),
                 Icon(Icons.keyboard_arrow_down_rounded,
                 )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
