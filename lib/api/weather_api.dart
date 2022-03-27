import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/utilites/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    var queryParameters = {
      'q': cityName,
      'appid': Constants.weatherAppId,
      'units': 'metric',
    };

    var uri = Uri.https(
      Constants.weatherBaseUplDomain,
      Constants.weatherForecastPath,
      queryParameters,
    );

    log('Request: ${uri.toString()}');

    var response = await http.get(uri);
    if (kDebugMode) {
      print('Response: ${response?.body}');
    }

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
