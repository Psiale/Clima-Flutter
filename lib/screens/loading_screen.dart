import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

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
    getLocationData();
  }

  getLocationData() async {
    LocationHandler locationHandler = new LocationHandler();
    await locationHandler.getLocation();
    latitude = locationHandler.latitude;
    longitude = locationHandler.longitude;

    print("latitude is: $latitude longitude is: $longitude");

    HTTPRequest httpRequest = HTTPRequest(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await httpRequest.fetchWeather();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    locationWeather: weatherData,
                  )),
          (_) => false);
    });

    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.purple,
          size: 100.0,
        ),
      ),
    );
  }
}
