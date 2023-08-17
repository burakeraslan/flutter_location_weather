class APIConstants {
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  static const String apiKey = "3178187dfaf03f85f27e52123775161c";

  static const String getApiUrl = "$baseUrl?lat={latitude}&lon={longitude}&appid=$apiKey";
}
