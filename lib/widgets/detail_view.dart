import 'package:flutter/material.dart';

import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/utilites/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    double pressure = snapshot.data!.list![0].pressure! * 0.750062;
    int humidity = snapshot.data!.list![0].humidity!;
    double speed = snapshot.data!.list![0].speed!;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getItem(Icons.thermostat_outlined, pressure.round(), 'mm Hg'),
          Util.getItem(Icons.water_drop, humidity, '%'),
          Util.getItem(Icons.air, speed.round(), 'm/s'),
        ],
      ),
    );
  }
}
