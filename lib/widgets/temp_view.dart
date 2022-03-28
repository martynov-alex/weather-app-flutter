import 'package:flutter/material.dart';
import 'package:weather_app_example/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    List forecastList = snapshot.data!.list!;
    String icon = forecastList[0].getIconUrl(x2Size: true);
    String temp = forecastList[0].temp.day.toStringAsFixed(0);
    String description = forecastList[0].weather[0].description.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon, color: Colors.black54),
          const SizedBox(width: 20),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(fontSize: 50, color: Colors.black87),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
