import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/utilites/constants.dart';
import 'package:weather_app_example/utilites/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool isCity = false}) async {
    Map<String, dynamic> queryParameters;

    if (isCity) {
      queryParameters = {
        'q': cityName,
        'appid': Constants.weatherAppId,
        'units': 'metric',
      };
    } else {
      Position position = await determinePosition();
      queryParameters = {
        'lon': position.longitude.toString(),
        'lat': position.latitude.toString(),
        'appid': Constants.weatherAppId,
        'units': 'metric',
      };
    }

    var uri = Uri.https(
      Constants.weatherBaseUplDomain,
      Constants.weatherForecastPath,
      queryParameters,
    );

    log('Request: ${uri.toString()}');

    var response = await http.get(uri);
    if (kDebugMode) {
      print('Response: ${response.body}');
    }

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
