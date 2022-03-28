import 'package:flutter/material.dart';
import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '7-day weather forecast'.toUpperCase(),
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Container(
            height: 140,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.list!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 8),
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width / 2.7,
                color: Colors.black87,
                child: ForecastCard(snapshot: snapshot, index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
