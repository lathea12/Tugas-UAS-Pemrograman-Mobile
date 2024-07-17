import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_current_location.dart';
import 'package:projekutslagi/components/my_description_box.dart';
import 'package:projekutslagi/components/my_drawer.dart';
import 'package:projekutslagi/components/my_food_tile.dart';
import 'package:projekutslagi/components/my_sliver_app_bar.dart';
import 'package:projekutslagi/components/my_tab_bar.dart';
import 'package:projekutslagi/models/food.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:projekutslagi/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tabbar controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out item
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return the list to given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get kategori menu

      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // get individual food makanan
          final food = categoryMenu[index];

          //get makanan atau food tile
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  //lokasi akhir
                  MyCurrentLocation(),

                  //deskripsi box
                  const MyDescriptionBox(),
                ],
              ),
            ),
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          ),
        ));
  }
}
