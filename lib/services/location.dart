import 'package:geolocator/geolocator.dart';

class LocationHandler {
  double latitude;
  double longitude;
  Future<Position> getLocation() async {
    bool serviceEnabled = true;
    LocationPermission permission;
    Position position;
    if (!serviceEnabled) {
      return Future.error(
          "location services are Disabled, please turn them on");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();
    }
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      Future.error(e);
      return e;
    }
    latitude = position.latitude;
    longitude = position.longitude;
    return position;
  }
}
