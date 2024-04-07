import 'package:flutter/material.dart';
import 'package:poultryguard/models/poultrymodel.dart';
import 'package:poultryguard/pages/product_page.dart';
import 'package:poultryguard/pages/routine_page.dart';
import 'package:poultryguard/pages/settings_page.dart';
import 'package:poultryguard/widgets/customsilverbar.dart';
import 'package:provider/provider.dart';
import '../models/poultryshopmodel.dart';
import '../widgets/custombottomnavigationbar.dart';
import '../widgets/customcurrentlocation.dart';
import '../widgets/customdescriptionbox.dart';
import '../widgets/customdrawer.dart';
import '../widgets/customtabbar.dart';
import '../widgets/customtile.dart';
import 'gemini_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: PoultryCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<PoultryModal> _filterByCategory(PoultryCategory category, List<PoultryModal> fullProduct){
    return fullProduct.where((product) => product.category == category).toList();
  }

  List<Widget> getProductInThisCategory(List<PoultryModal> fullProduct){
    return PoultryCategory.values.map((category){
      List<PoultryModal> categoryProduct =_filterByCategory(category, fullProduct);

      return ListView.builder(
          itemCount: categoryProduct.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            final product = categoryProduct[index];
          return ProductTile(
            product: product,
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product: product))),
          );
      });
    }).toList();
  }


  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const GeminiPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const RoutinePage()));
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      bottomNavigationBar: NavigationBar(
        destinations:   [
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.store_rounded, color: Theme.of(context).colorScheme.primary,),
            label: "Store",
            isSelected: true,
            onTap: () => _onTabTapped(0),
          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.man_rounded,color: Theme.of(context).colorScheme.primary,),
            label: "Gemini Vet",
            isSelected: false,
            onTap: () => _onTabTapped(1),
          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Theme.of(context).colorScheme.primary,),
            label: "Daily Routine",
            isSelected: false,
            onTap: () => _onTabTapped(2),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled)=>[
          CustomSilverBar(
            title: CustomTabBar(tabController: _tabController),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const CustomCurrentLocation(),
                const CustomDescriptionBox()
              ],
            ),
          )
        ],
      body: Consumer<Shop>(
        builder: (context, shop, child) =>
          TabBarView(
            controller: _tabController,
            children: getProductInThisCategory(shop.productMenu),
          ),
      )
      ),
    );
  }
}
