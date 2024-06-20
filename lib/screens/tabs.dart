import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_categories_data.dart';
// import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
// import 'package:meals/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

// const kFilters = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedTabIndex = 0;
  // final List<Meal> _favoriteMeals = [];
  // Map<Filter, bool> selectedFilters = kFilters;
  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Meal is no longer a favorite');
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //     _showInfoMessage('Marked as a favorite!');
  //   }
  // }

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      // final result =
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
              // selectedFilters: selectedFilters,
              ),
        ),
      );
      // setState(() {
      //   selectedFilters = result ?? kFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filtersProvider);
    // final availableMeals = meals.where((meal) {
    //   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();
    Widget activeTabScreen = CategoriesScreen(
      // onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activeTabTitle = 'Categories';
    if (_selectedTabIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeTabScreen = MealsScreen(
        meals: favoriteMeals,
        // onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activeTabTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTabTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
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
