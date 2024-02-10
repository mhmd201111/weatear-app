import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/providers/weprovide.dart';


void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  weathermodel? weather;
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return weatherprovider();
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}