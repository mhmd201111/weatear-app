import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_model.dart';

class weatherprovider extends ChangeNotifier{
  weathermodel? _weatherdata;
  String? cityname;
  set weatherdata (weathermodel? weather){
    _weatherdata =weather;
    notifyListeners();
  }
  weathermodel? get weatherdata => _weatherdata;
  
}