import 'package:bloc_login/data/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/bindings/bindings.dart';
import 'services/routes/route_services.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteServices.splashScreen,
      getPages: RouteServices.routes,
      initialBinding: InitialBindings(),
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
    );
  }
}
