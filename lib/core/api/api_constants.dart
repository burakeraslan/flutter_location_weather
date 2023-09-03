class ApiConstants {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  String apiKey = "3178187dfaf03f85f27e52123775161c";
  String getApiUrl(String latitude, String longitude) {
    return "$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey";
  }
}
