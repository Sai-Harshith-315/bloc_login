import 'package:bloc_login/data/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bussiness/binding/bindings.dart';
import 'presentation/routes/routes.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: RouteServices.signUpScreen,
      getPages: RouteServices.routes,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
    );
  }
}
