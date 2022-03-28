import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:weather_app_example/api/weather_api.dart';
import 'package:weather_app_example/models/weather_forecast_daily.dart';
import 'package:weather_app_example/screens/city_screen.dart';
import 'package:weather_app_example/widgets/bottom_list_view.dart';
import 'package:weather_app_example/widgets/city_view.dart';
import 'package:weather_app_example/widgets/detail_view.dart';
import 'package:weather_app_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key, required this.locationWeather})
      : super(key: key);

  final WeatherForecast? locationWeather;

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Openweathermap.org'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              String? selectedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CityScreen(),
                ),
              );
              if (selectedCity != null) {
                setState(() {
                  _cityName = selectedCity;
                  forecastObject = WeatherApi().fetchWeatherForecast(
                    cityName: _cityName,
                    isCity: true,
                  );
                });
              }
            },
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
                      const SizedBox(height: 50),
                      CityView(snapshot: snapshot),
                      const SizedBox(height: 20),
                      TempView(snapshot: snapshot),
                      const SizedBox(height: 20),
                      DetailView(snapshot: snapshot),
                      const SizedBox(height: 50),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('City not found\n Please, enter correct city',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
