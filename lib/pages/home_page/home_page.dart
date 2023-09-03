import 'package:flutter/material.dart';
import 'package:flutter_location_weather/pages/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.blueGrey[400],
          elevation: 0,
        ),
        backgroundColor: Colors.blueGrey[400],
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
              ),
              Text(
                "${(DateTime.fromMillisecondsSinceEpoch(controller.dt.toInt() * 1000).month)} / ${(DateTime.fromMillisecondsSinceEpoch(controller.dt.toInt() * 1000).day)}",
                style: const TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(150, 255, 255, 255),
                ),
              ),
              Text(
                (controller.temp.toString()),
                style: const TextStyle(
                  fontSize: 250,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.weatherMain.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(150, 255, 255, 255),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      "assets/icons/${controller.icon}.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
