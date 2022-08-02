import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.getLatitude();
    longitude = location.getLongitude();
    Networking calls = Networking();
    var data = await calls.sendWeatherRequest(latitude!, longitude!);
    print(data['main']['temp']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
