import 'package:flutter/material.dart';
import 'package:flutter_location_weather/controller.dart';
import 'package:flutter_location_weather/fetch.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherMainController = Get.put(WeatherMainController());
    final weatherIconController = Get.put(WeatherIconController());
    final mainTempController = Get.put(MainTempController());
    final dtController = Get.put(DTController());
    final nameController = Get.put(NameController());

    Future<void> fetchData() async {
      await FetchData().fetchData(context);
    }

    fetchData();

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.red, elevation: 0),
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                nameController.name.toUpperCase(),
                style: const TextStyle(fontSize: 25, color: Color.fromARGB(100, 255, 255, 255)),
              )),
          Obx(() => Text(
                "${(DateTime.fromMillisecondsSinceEpoch(dtController.dt.toInt() * 1000).month)} / ${(DateTime.fromMillisecondsSinceEpoch(dtController.dt.toInt() * 1000).day)}",
                style: const TextStyle(fontSize: 35, color: Color.fromARGB(150, 255, 255, 255)),
              )),
          Obx(() => Text(
                ((mainTempController.mainTemp.toDouble() - 273.15.toDouble()).ceil().toInt()).toString(),
                style: const TextStyle(
                  fontSize: 300,
                  color: Colors.black,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(weatherMainController.weatherMain.toUpperCase(), style: const TextStyle(fontSize: 35, color: Color.fromARGB(150, 255, 255, 255)))),
              Obx(() => Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      "assets/icons/${weatherIconController.weatherIcon}.png",
                      width: 30,
                      height: 30,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
