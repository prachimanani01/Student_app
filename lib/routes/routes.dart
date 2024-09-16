import 'package:flutter/cupertino.dart';
import 'package:student_app/screen/home_page/home_page.dart';
import '../../screen/splash_screen/splash_screen.dart';
import '../screen/details_page/details_page.dart';

class Routes {
  static String splash_screen = '/';
  static String home_page = 'home_page';
  static String details_page = 'details_page';

  static Map<String, WidgetBuilder> myRoutes = {
    splash_screen: (context) => const SplashScreen(),
    home_page: (context) => const HomePage(),
    details_page: (context) => const DetailsPage(),
  };
}
