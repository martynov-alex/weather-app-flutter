import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_app_example/api/weather_api.dart';
import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/widgets/city_view.dart';
import 'package:weather_app_example/widgets/detail_view.dart';
import 'package:weather_app_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
    //forecastObject.then((weather) => print(weather.list?[0].weather?[0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 20),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 20),
                      DetailView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: SpinKitPulse(
                      color: Colors.black,
                      size: 100.0,
                    ),
                  );
                }
                //
              },
            ),
          )
        ],
      ),
    );
  }
}
