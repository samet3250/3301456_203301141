import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_news_app/model/location.dart';

class WeatherData {
  double? lat;
  double? lon;
  late String state;
  late String degree;
  late String city;

  WeatherData({this.lat, this.lon});

  Future<void> getWeatherElements() async {
    var response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=be28d957903e30cf3e28696358b6e418&units=metric"),
    );

    if (response.statusCode == 200) {
      try {
        String data = response.body;
        var currentWeather = jsonDecode(data);
        state = currentWeather["weather"][0]["description"].toString();
        city = currentWeather["name"].toString();
        degree = (currentWeather["main"]["temp"].round()).toString() + "°";
      } catch (e) {
        print(e);
      }
    } else {
      print("API den değer gelmiyor");
    }
  }
}
