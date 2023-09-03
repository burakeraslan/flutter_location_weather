import 'package:flutter/material.dart';
import 'package:flutter_location_weather/pages/home_page/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Flutter Location Weather",
      home: HomePage(),
    );
  }
}
