import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      // body: ListView.builder(
      //   itemCount: dummyMeals.length,
      //   itemBuilder: (ctx, index) => dummyMeals.isNotEmpty
      //       ? GridView(
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             childAspectRatio: 3 / 2,
      //             crossAxisSpacing: 20,
      //             mainAxisSpacing: 20,
      //           ),
      //           children: dummyMeals.map((e) => const MealGridItem()).toList(),
      //         )
      //       : const Center(child: Text('No meals list found')),
      // ),
    );
  }
}