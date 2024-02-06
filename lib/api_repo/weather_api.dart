import 'dart:convert';

import 'package:http/http.dart';

import '../model/hourly_weather_model.dart';

const String baseUrl = 'http://api.openweathermap.org/data/2.5';

class WeatherApi{

  static Future<HourlyWeatherModel>getWeatherData(String city)async{
    Uri url = Uri.parse('$baseUrl/forecast?q=$city&APPID=1f5b18d6d186d54f288e2e0ad0a8a937');
    Response response = await get(url);
    if(response.statusCode == 200){
      final Map<String, dynamic> returnedData = json.decode(response.body);
      return HourlyWeatherModel.fromJson(returnedData);
    }
    else {
      throw Exception('there is no data returned');
    }
  }
}