import 'package:weather_app/model/clouds.dart';
import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weahter.dart';
import 'package:weather_app/model/wind.dart';

import 'main_weather.dart';

class ListWeather {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  final DateTime dt_txt;

  ListWeather(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.sys,
      required this.dt_txt});

  factory ListWeather.fromJson(Map<String, dynamic> json) {
    return ListWeather(
        dt: int.parse(json['dt'].toString()),
        main: Main.fromJson(json['main']),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json['clouds']),
        wind: Wind.fromJson(json['wind']),
        visibility: int.parse(json['visibility'].toString()),
        pop: double.parse(json['pop'].toString()),
        sys: Sys.fromJson(json['sys']),
        dt_txt: DateTime.parse(json["dt_txt"]));
  }
  Map<String, dynamic> toJson()=>{
    'dt':dt,
    'main': main.toJson(),
    'weather':  List<dynamic>.from(weather.map((x) => x.toJson())),
    'clouds': clouds.toJson(),
    'wind': wind.toJson(),
    'visibility': visibility,
    'pop': pop,
    'sys': sys.toJson(),
    'dt_txt': dt_txt.toIso8601String(),
  };
}
