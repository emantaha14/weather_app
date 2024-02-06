import 'coord.dart';
class City{
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset});


  factory City.fromJson(Map<String, dynamic> json){
    return City(id: int.parse(json['id'].toString()),
        name: json['name'],
        coord: Coord.fromJson(json['coord']),
        country: json['country'],
        population: int.parse(json['population'].toString()),
        timezone: int.parse(json['timezone'].toString()),
        sunrise: int.parse(json['sunrise'].toString()),
        sunset: int.parse(json['sunset'].toString()));
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' :name,
    'coord':coord?.toJson(),
    'country':country,
    'population': population,
    'timezone': timezone,
    'sunrise': sunrise,
    'sunset': sunset,
  };

}
