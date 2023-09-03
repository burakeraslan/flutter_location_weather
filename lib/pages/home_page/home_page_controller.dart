import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_location_weather/core/api/api_constants.dart';
import 'package:flutter_location_weather/core/permission.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Get Current Position
  double latitude = 0.0;
  double longitude = 0.0;

  Future getCurrentPosition() async {
    final permission = await handleLocationPermission(Get.context!);

    if (permission == false) {
      throw Exception("Location permission denied");
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Fetch Data

  Map<String, dynamic>? data;
  List<dynamic>? weather;
  Map<String, dynamic>? main;
  RxString weatherMain = "".obs;
  RxString icon = "".obs;
  double mainTemp = 0.0;
  RxInt dt = 0.obs;
  RxString name = "".obs;
  double tempCelsius = 0.0;
  int tempCeil = 0;
  RxInt temp = 0.obs;

  Future fetchData() async {
    await getCurrentPosition();
    String api = ApiConstants().getApiUrl(latitude.toString(), longitude.toString());
    print(api);
    var response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      if (data != null) {
        weather = data!["weather"];
        main = data!["main"];

        weatherMain.value = weather![0]["main"];
        icon.value = weather![0]["icon"];
        mainTemp = main!["temp"];
        dt.value = data!["dt"];
        name.value = data!["name"];

        tempCelsius = mainTemp - 273.15;
        tempCeil = tempCelsius.ceil();
        temp.value = tempCeil;
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
}
