class weathermodel{
   String date;
   double temp;
   double maxtemp;
   double mintemp;
   String weatherstate;

  weathermodel({
    required this.date, 
    required this.temp, 
    required this.maxtemp, 
    required this.mintemp, 
    required this.weatherstate});
  factory weathermodel.fromJson(dynamic data){
    var jsonData= data['forecast']['forecastday'][0]['day'];
    
    return weathermodel(
      date: data['location']["localtime"], 
      temp:jsonData['avgtemp_c'], 
      maxtemp: jsonData['maxtemp_c'],
     mintemp:jsonData['mintemp_c'], 
     weatherstate: jsonData['condition']['text']);
  }
  String getimag(){
    if(weatherstate =='Clear'||weatherstate== 'Sunny'){
      return 'assets/images/clear.png'; 
    }else if(weatherstate =='Sleat'||weatherstate=='Snow'||weatherstate=='Hail'){
      return'assets/images/snow.png';
    }else if(weatherstate=='Heavy Cloud'){
      return'assets/images/cloudy.png';
    }else if(weatherstate=='Light Rain'||weatherstate=='Patchy rain possible'||weatherstate=='Showers'){
      return 'assets/images/rainy.png';
    }else if(weatherstate=='Thunderstorm'||weatherstate=='Thunder'){
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

}