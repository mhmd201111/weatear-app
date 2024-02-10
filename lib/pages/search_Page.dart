import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weprovide.dart';
import 'package:weather/services/weather_services.dart';

class searchpage extends StatelessWidget {
  
String? cityname;
VoidCallback? updateui;
searchpage({this.updateui});

  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async{
             cityname=value; 
             weatherservices services =weatherservices();
             weathermodel? weather = await services.getweather(cityname: cityname!);
             Provider.of<weatherprovider>(context,listen: false).weatherdata=weather;
             Provider.of<weatherprovider>(context,listen: false).cityname=cityname;
            
            Navigator.pop(context);
            },
            
            decoration: InputDecoration(
            hintText: 'enter a city',
            label: Text('search'),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 24),
          )),
        ),
      ),

    );
  }
}

