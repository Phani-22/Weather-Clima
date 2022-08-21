import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    permissionsLocation();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }),
    );
  }

  void permissionsLocation() async {
    var status = Permission.location.status;
    if (status.isGranted != null) {
      getLocationData();
    }
    if (await Permission.location.request().isGranted) {
      getLocationData();
    }
    if (await Permission.speech.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
