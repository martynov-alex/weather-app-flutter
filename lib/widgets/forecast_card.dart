import 'package:flutter/material.dart';
import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/utilites/forecast_util.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    List forecastList = snapshot.data!.list!;
    int millisecondsSinceEpoch = forecastList[index].dt! * 1000;
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    String dayOfWeek = Util.getFormattedDate(dateTime).split(',').first;

    double minTemp = forecastList[index].temp!.min!;
    String icon = forecastList[index].getIconUrl();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            dayOfWeek,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${minTemp.toStringAsFixed(0)} °C',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Image.network(icon, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
