import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/common/widgets/bottom_bar.dart';
import 'package:prjct223_d1_24/features/admin/screens/add_products_screens.dart';
import 'package:prjct223_d1_24/features/adress/screens/addres_screen.dart';
import 'package:prjct223_d1_24/features/auth/auth_screen.dart';
import 'package:prjct223_d1_24/features/products_page/screens/product_page_screens.dart';
import 'package:prjct223_d1_24/features/search/screens/search_screen.dart';
import 'package:prjct223_d1_24/home/screens/category_deals.dart';
import 'package:prjct223_d1_24/home/screens/home_screens.dart';
import 'package:prjct223_d1_24/models/products.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealsScreen(
                category: category,
              ));
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));
    case ProductPageScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductPageScreen(
                product: product,
              ));
    case AddressScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddressScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("404 not found"),
                ),
              ));
  }
}
