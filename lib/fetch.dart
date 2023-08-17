import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_location_weather/api_key.dart';
import 'package:flutter_location_weather/controller.dart';
import 'package:flutter_location_weather/location.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchData {
  final latitudeController = Get.put(LatitudeController());
  final longitudeController = Get.put(LongitudeController());
  String apiKey = APIKey().apiKey;
  String? api;

  Map<String, dynamic>? data;
  List<dynamic>? weather;
  Map<String, dynamic>? main;

  final weatherMainController = Get.find<WeatherMainController>();
  final weatherIconController = Get.find<WeatherIconController>();
  final mainTempController = Get.find<MainTempController>();
  final dtController = Get.find<DTController>();
  final nameController = Get.find<NameController>();

  double? temp;
  double? tempCelsius;
  int? tempCeil;

  Future fetchData(BuildContext context) async {
    await getCurrentPosition(context);
    api = "https://api.openweathermap.org/data/2.5/weather?lat=${latitudeController.latitude}&lon=${longitudeController.longitude}&appid=$apiKey";
    var response = await http.get(Uri.parse(api!));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      if (data != null) {
        weather = data!["weather"];
        main = data!["main"];

        weatherMainController.updateWeatherMain(weather![0]["main"]);
        weatherIconController.updateWeatherIcon(weather![0]["icon"]);
        mainTempController.updateMainTemp(main!["temp"]);
        dtController.updateDt(data!["dt"]);
        nameController.updateName(data!["name"]);
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
}
