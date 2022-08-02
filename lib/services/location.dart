import 'package:geolocator/geolocator.dart';

class Location {
  late double _longitude;
  late double _latitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission per = await Geolocator.requestPermission();
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _latitude = pos.latitude;
      _longitude = pos.longitude;
    } catch (e) {
      print(e);
    }
  }

  double getLongitude() {
    return _longitude;
  }

  double getLatitude() {
    return _latitude;
  }
}
