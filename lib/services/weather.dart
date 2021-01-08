import 'package:clima/screens/location_screen.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter/material.dart';

const String apiKey = '55b9e2fc241864ad1805c87262e98f50';
const String url = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  getLocationWeather(BuildContext context) async {
    LocationHandler locationHandler = new LocationHandler();
    await locationHandler.getLocation();

    print(
        "latitude is: ${locationHandler.latitude} longitude is: ${locationHandler.longitude}");

    HTTPRequest httpRequest = HTTPRequest(
        "$url?lat=${locationHandler.latitude}&lon=${locationHandler.longitude}&appid=$apiKey");

    var weatherData = await httpRequest.fetchWeather();



    return weatherData;
  }
}
