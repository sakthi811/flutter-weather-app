import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/screens/location_screen.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LocationScreen(
              locationWeather: weatherData,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
