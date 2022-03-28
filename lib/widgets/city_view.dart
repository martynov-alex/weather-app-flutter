import 'package:flutter/material.dart';

import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/utilites/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    String city = snapshot.data!.city!.name!;
    String country = snapshot.data!.city!.country!;
    // https://ru.wikipedia.org/wiki/Unix-%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
    DateTime formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);

    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            Util.getFormattedDate(formattedDate),
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
