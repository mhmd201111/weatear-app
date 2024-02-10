import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/pages/search_Page.dart';
import 'package:weather/providers/weprovide.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  weathermodel? weatherdata;
  
  @override
  Widget build(BuildContext context) {
    weatherdata =Provider.of<weatherprovider>(context).weatherdata;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return searchpage();
            }));
          }, icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherdata == null 
      ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
      :Container(
      color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
          Text(Provider.of<weatherprovider>(context).cityname!,
          style: TextStyle(fontSize: 32,fontWeight:FontWeight.bold),),
          Text('updated at :${weatherdata!.date.toString()}',
          style: TextStyle(fontSize: 24,)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.asset(weatherdata?.getimag()??''),
            Text(weatherdata!.temp.toInt().toString(),
            style: TextStyle(fontSize: 32,fontWeight:FontWeight.bold),),
              Column(
            children: [
              Text('max temp : ${weatherdata!.maxtemp.toInt()}'),
          Text('min temp :${weatherdata!.mintemp.toInt()}'),

            ],
          ),
          ],),
          Spacer(),
          Text(weatherdata!.weatherstate,
          style: TextStyle(fontSize: 32,fontWeight:FontWeight.bold),),
          Spacer(flex: 2,)
        
        ]),
        
      ),
    );
  }
}
