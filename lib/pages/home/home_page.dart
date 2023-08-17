import 'package:flutter/material.dart';
import 'package:flutter_location_weather/pages/home/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      HomePageController(),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: GetBuilder<HomePageController>(
        builder: (homePageController) {
          if (homePageController.weatherModel.value == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white38,
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homePageController.weatherModel.value?.name ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white38,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now().add(Duration(seconds: homePageController.weatherModel.value?.timezone ?? 0))),
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white38,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ((homePageController.weatherModel.value?.main?.temp?.toDouble() ?? 0) - 273.15.toDouble()).ceil().toInt().toString(),
                style: const TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    homePageController.weatherModel.value?.weather?.first?.main ?? "",
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white38,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      "assets/icons/${homePageController.weatherModel.value?.weather?.first?.icon}.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
