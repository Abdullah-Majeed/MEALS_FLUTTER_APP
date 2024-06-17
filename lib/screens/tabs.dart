import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget activeTabScreen = const CategoriesScreen();
    var activeTabTitle = 'Categories';
    if (_selectedTabIndex == 1) {
      activeTabScreen = const MealsScreen(meals: []);
      activeTabTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTabTitle),
      ),
      body: activeTabScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
