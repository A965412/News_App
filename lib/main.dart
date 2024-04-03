import 'package:flutter/material.dart';
import 'package:news_application/Home_page/home_page.dart';
import 'package:news_application/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_page.Route_name,
      routes: {
        Home_page.Route_name: (context) => Home_page(),
      },
      theme: Mytheme().lighttheme,
    );
  }
}
