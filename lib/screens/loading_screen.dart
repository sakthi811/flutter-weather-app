import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    Position position = await location.getCurrentLocation();
    print(position);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=37.4220936&lon=-122.083922&appid=f5d646c49ec8de2b4fbe0f4df30570f6'));
    String data = response.body;
    var decodedData = jsonDecode(data);
    var temperature = decodedData['main']['temp'];
    var condition = decodedData['weather'][0]['main'];
    String city = decodedData['name'];
    print('$temperature $condition $city');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
