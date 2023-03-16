import 'package:weatherapp/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/weather.dart';





class LodingScreen extends StatefulWidget {
  const LodingScreen({Key? key}) : super(key: key);

  @override
  State<LodingScreen> createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData =  await WeatherModel().getLocationWeather();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen(
      locationWeather: weatherData,
    ),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.red,
          size: 100,
        ),
      ),
    );
  }
}
