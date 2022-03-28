import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_example/api/weather_api.dart';
import 'package:weather_app_example/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var forecastObject;

  void getLocationData() async {
    try {
      forecastObject = await WeatherApi().fetchWeatherForecast();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              WeatherForecastScreen(locationWeather: forecastObject),
        ),
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPulse(color: Colors.black, size: 100.0),
      ),
    );
  }
}
