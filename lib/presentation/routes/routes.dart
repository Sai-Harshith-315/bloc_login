import 'package:get/get.dart';

import '../screens/signup_screen.dart';

// Define your routes
class RouteServices {
  static const String splashScreen = '/';

  static const String signUpScreen = '/SignUpScreen';

  static final List<GetPage> routes = [
    GetPage(name: signUpScreen, page: () => SignUpScreen()),

    //addReviewScreen

    // Add more routes here
  ];
}
