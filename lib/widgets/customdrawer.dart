import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import 'customdrawertile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:  Column(
        children: [
          const SizedBox(height: 70),
          Container(
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
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(),
          ),
          CustomDrawerTile(
            text: "Home",
            icon: Icons.home_rounded,
            onTap: ()=> Navigator.pop(context),
          ),
          CustomDrawerTile(
            text: "Settings",
            icon: Icons.settings,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
            },
          ),
          const Spacer(),
          CustomDrawerTile(
            text: "Log out",
            icon: Icons.exit_to_app,
            onTap: (){},
          ),
          const SizedBox(height: 25,)


        ],
      ),
    );
  }
}
