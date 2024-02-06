import 'city.dart';
import 'list.dart';

class HourlyWeatherModel{
  final String cod;
  final int message;
  final int cnt;
  final List<ListWeather>? listWeather;
  final City city;

  HourlyWeatherModel({required this.cod,
    required this.message,
    required this.cnt,
    required this.listWeather,
    required this.city});

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json){
    return HourlyWeatherModel(
        cod: json['cod'],
        message: json['message'],
        cnt: json['cnt'],
        listWeather: List<ListWeather>.from(json["list"].map((x) => ListWeather.fromJson(x))),
        city: City.fromJson(json['city']));
  }

  Map<String, dynamic> toJson()=>{
    'cod':cod,
    'message':message,
    'cnt':cnt,
    'list': List<dynamic>.from(listWeather!.map((x) => x.toJson())),
    'city':city.toJson()
  };
}