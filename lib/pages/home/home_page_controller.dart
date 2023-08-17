import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_location_weather/core/api/api_constants.dart';
import 'package:flutter_location_weather/core/permission_manager.dart';
import 'package:flutter_location_weather/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  Rx<WeatherModel?> weatherModel = Rx<WeatherModel?>(null);

  Rx<double> latitude = Rx<double>(0.0);
  Rx<double> longitude = Rx<double>(0.0);
  @override
  void onInit() {
    _init();

    super.onInit();
  }

  Future<void> _init() async {
    await getWeatherData();
  }

  Future<void> getWeatherData() async {
    await getCurrentPosition();
    try {
      String apiUrl = APIConstants.getApiUrl
          .replaceAll(
            "{latitude}",
            latitude.value.toString(),
          )
          .replaceAll(
            "{longitude}",
            longitude.value.toString(),
          );

      var dio = await Dio().get(apiUrl);

      if (dio.statusCode != 200) {
        throw Exception("Status code is not 200: ${dio.statusCode}");
      }

      var data = dio.data;
      if (data != null) {
        log(data.toString());
        weatherModel.value = WeatherModel.fromJson(data);
      }

      update();
    } on Exception {
      throw Exception("Failed to load data");
    }
  }

  Future getCurrentPosition() async {
    final permission = await PermissionManager.checkLocationPermission();

    if (permission == false) {
      throw Exception("Location permission denied");
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      update();
    } catch (e) {
      throw Exception("Failed to get current position");
    }
  }
}
