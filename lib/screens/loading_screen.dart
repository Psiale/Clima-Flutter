import 'package:flutter/material.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationHandler locationHandler = new LocationHandler();
    await locationHandler.getLocation();
    print(
        "latitude is: ${locationHandler.latitude} longitude is: ${locationHandler.longitude}");
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
