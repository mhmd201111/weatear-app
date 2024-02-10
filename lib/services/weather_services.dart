import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:weather/models/weather_model.dart';
class weatherservices {
  String baseUrl ='http://api.weatherapi.com/v1';
  String apiKey ='970cd1ee70704e27b5b200419232606';
  Future<weathermodel> getweather({required String cityname})async
  {
    Uri url =Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=7');
    http.Response response= await http.get(url);
    Map<String,dynamic>data = jsonDecode(response.body);
    
    weathermodel weather =weathermodel.fromJson(data);
    
    return weather;
    
   
  }
}