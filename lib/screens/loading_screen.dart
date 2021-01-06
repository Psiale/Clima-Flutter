import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  final String apiKey = '55b9e2fc241864ad1805c87262e98f50';
  @override
  void initState() {
    super.initState();
    getLocation();
    print(getWeather(latitude, longitude));
  }

  getLocation() async {
    LocationHandler locationHandler = new LocationHandler();
    await locationHandler.getLocation();
    print(
        "latitude is: ${locationHandler.latitude} longitude is: ${locationHandler.longitude}");
    latitude = locationHandler.latitude;
    longitude = locationHandler.longitude;
  }

  getWeather(lat, lon) async {
    HTTPRequest httpRequest = HTTPRequest(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey");
    var response = await httpRequest.fetchWeather(lat, lon);
    print(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
          strokeWidth: 10.0,
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
