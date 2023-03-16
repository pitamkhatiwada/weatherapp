import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/services/weather.dart';
import 'package:weatherapp/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int tempp;
  late String weatherIcon;
  late String cityName;
  late String weatherMassage;

  @override
  void initState() {
    super.initState();
    upDateUi(widget.locationWeather);
  }

  void upDateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        tempp = 0;
        weatherIcon = 'errer';
        weatherMassage = 'unable to provide';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      tempp = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMassage = weather.getMessage(tempp);
      cityName = weatherData['name'];
      print(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      upDateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                     var typeName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                     if(typeName != null){
                       var weatherData= await weather.getCityWeather(typeName);
                       upDateUi(weatherData);
                     }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$tempp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMassage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
