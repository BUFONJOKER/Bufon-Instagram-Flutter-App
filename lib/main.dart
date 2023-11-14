import 'package:bufoninstagram_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bufoninstagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:bufoninstagram_flutter/responsive/responsive_layout.dart';
import 'package:bufoninstagram_flutter/responsive/web_screen_layout.dart';
import 'package:bufoninstagram_flutter/utilities/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bufoninstagram_flutter/screens/signup_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDwAN8XGp9hqe_BQ4vbzMGU4P13iD79yEY",
          appId: "1:161393768206:web:3837788956098ad2ed095f",
          messagingSenderId: "161393768206",
          projectId: "bufon-instagram-clone",
          storageBucket: "bufon-instagram-clone.appspot.com",
          ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bufoninstagram_Flutter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),

      home: const SignUpScreen(),
    );
  }
}
