import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

// class FiltersScreen extends ConsumerStatefulWidget {
//   const FiltersScreen({
//     super.key,
//     // required this.selectedFilters
//   });
//   // final Map<Filter, bool> selectedFilters;

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final activeFilters = ref.read(filtersProvider);
//     // _glutenFreeFilterSet = widget.selectedFilters[Filter.glutenFree]!;
//     // _lactoseFreeFilterSet = widget.selectedFilters[Filter.lactoseFree]!;
//     // _veganFilterSet = widget.selectedFilters[Filter.vegetarian]!;
//     // _veganFilterSet = widget.selectedFilters[Filter.vegan]!;
//     _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
//     _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
//     _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
//     _veganFilterSet = activeFilters[Filter.vegan]!;
//   }
//   // void _setScreen(String identifier) {
//   //   Navigator.pop(context);
//   //   if (identifier == 'meals') {
//   //     Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(
//   //           builder: (ctx) => const TabsScreen(),
//   //         ));
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Filters'),
//       ),
//       // drawer: MainDrawer(
//       //   onSelectScreen: _setScreen,
//       // ),
//       body: PopScope(
//         // canPop: true,
//         onPopInvoked: (bool didPop) {
//           // if (didPop) return;
//           ref.read(filtersProvider.notifier).setFilters({
//             Filter.glutenFree: _glutenFreeFilterSet,
//             Filter.lactoseFree: _lactoseFreeFilterSet,
//             Filter.vegetarian: _vegetarianFilterSet,
//             Filter.vegan: _veganFilterSet,
//           });
//           // Navigator.of(context).pop({
//           //   Filter.glutenFree: _glutenFreeFilterSet,
//           //   Filter.lactoseFree: _lactoseFreeFilterSet,
//           //   Filter.vegetarian: _vegetarianFilterSet,
//           //   Filter.vegan: _veganFilterSet,
//           // });
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterSet,
//               onChanged: (value) {
//                 setState(() {
//                   _glutenFreeFilterSet = value;
//                 });
//               },
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include gluten-free meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(
//                 left: 34,
//                 right: 22,
//               ),
//             ),
//             SwitchListTile(
//               value: _lactoseFreeFilterSet,
//               onChanged: (value) {
//                 setState(() {
//                   _lactoseFreeFilterSet = value;
//                 });
//               },
//               title: Text(
//                 'Lactose-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include lactose-free meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(
//                 left: 34,
//                 right: 22,
//               ),
//             ),
//             SwitchListTile(
//               value: _vegetarianFilterSet,
//               onChanged: (value) {
//                 setState(() {
//                   _vegetarianFilterSet = value;
//                 });
//               },
//               title: Text(
//                 'Vegetarian',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include vegetarian meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(
//                 left: 34,
//                 right: 22,
//               ),
//             ),
//             SwitchListTile(
//               value: _veganFilterSet,
//               onChanged: (value) {
//                 setState(() {
//                   _veganFilterSet = value;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include vegan meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(
//                 left: 34,
//                 right: 22,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          )
        ],
      ),
    );
  }
}
