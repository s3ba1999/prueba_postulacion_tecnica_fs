import 'package:flutter/material.dart';
import 'package:prueba_tecnica_postulacion/models/models.dart';
import 'package:prueba_tecnica_postulacion/screens/alert_screen.dart';
import 'package:prueba_tecnica_postulacion/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  //

  static final menuOptions = <MenuOption>[
    // todo:borrar home
    MenuOption(
      route: 'home',
      icon: Icons.card_giftcard_rounded,
      name: 'HomeScreen',
      screen:  HomeScreen(),
    ),
    MenuOption(
      route: 'new_post',
      icon: Icons.add,
      name: 'ListView 1',
      screen: const NewPost(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (context) => option.screen});
    }

    return appRoutes;
  }

/*
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (context) => const HomeScreen(),
    'listview1': (context) => const ListView1_Screen(),
    'listview2': (context) => const ListView2_Screen(),
    'alert': (context) => const AlertScreen(),
    'card': (context) => const CardScreen(),
  };

  */

  //
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => AlertScreen());
  }
}
