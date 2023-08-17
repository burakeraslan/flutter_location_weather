import 'package:get/get.dart';

class LatitudeController extends GetxController {
  RxDouble latitude = 0.0.obs;

  void updateLatitude(double newLatitude) {
    latitude.value = newLatitude;
  }
}

class LongitudeController extends GetxController {
  RxDouble longitude = 0.0.obs;

  void updateLongitude(double newLongitude) {
    longitude.value = newLongitude;
  }
}

class WeatherMainController extends GetxController {
  RxString weatherMain = "".obs;

  void updateWeatherMain(String newWeatherMain) {
    weatherMain.value = newWeatherMain;
  }
}

class WeatherIconController extends GetxController {
  RxString weatherIcon = "".obs;

  void updateWeatherIcon(String newWeatherIcon) {
    weatherIcon.value = newWeatherIcon;
  }
}

class MainTempController extends GetxController {
  RxDouble mainTemp = 0.0.obs;

  void updateMainTemp(double newMainTemp) {
    mainTemp.value = newMainTemp;
  }
}

class DTController extends GetxController {
  RxInt dt = 0.obs;

  void updateDt(int newDt) {
    dt.value = newDt;
  }
}

class NameController extends GetxController {
  RxString name = "".obs;

  void updateName(String newName) {
    name.value = newName;
  }
}
