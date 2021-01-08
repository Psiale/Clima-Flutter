import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'city_screen.dart';
import 'package:screenshot_share_image/screenshot_share_image.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var weatherData;
  var temperature;
  int condition;
  String cityName;
  String weatherMessage;
  WeatherModel weatherModel = new WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = '';
        condition = 0;
        temperature = 0;
        weatherMessage = "please turn on your location";
        return;
      }
      cityName = weatherData['name'];
      condition = weatherData['weather'][0]['id'];
      temperature = weatherData['main']['temp'];
      weatherMessage = weatherModel.getMessage(temperature.toInt());
    });
  }

  Future takeScreenShot() async {
    Future.delayed(Duration(seconds: 1), () {
      ScreenshotShareImage.takeScreenshotShareImage();
    });

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData =
                          await weatherModel.getLocationWeather(context);
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${temperature.round()}°C ",
                      style: kTempTextStyle,
                    ),
                    Text(
                      "${weatherModel.getWeatherIcon(condition)}",
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  " $weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: FlatButton(
                    onPressed: () {
                      takeScreenShot();
                    },
                    child: Icon(
                      Icons.share,
                      size: 60.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// double temperature = weatherData['main']['temp'];
// int condition = weatherData['weather'][0]['id'];
// String cityName = weatherData['name'];
// print(temperature);
// print(condition);
// print(cityName);
