class Main{
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int sea_level;
  final int grnd_level;
  final int humidity;
  final double temp_kf;

  Main({required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.grnd_level,
    required this.sea_level,
    required this.humidity,
    required this.temp_kf});

  factory Main.fromJson(Map<String, dynamic> json){
    return Main(temp: double.parse(json['temp'].toString()),
        feels_like: double.parse(json['feels_like'].toString()),
        temp_min: double.parse(json['temp_min'].toString()),
        temp_max: double.parse(json['temp_max'].toString()),
        pressure: int.parse(json['pressure'].toString()),
        sea_level: int.parse(json['sea_level'].toString()),
        grnd_level: int.parse(json['grnd_level'].toString()),
        humidity: int.parse(json['humidity'].toString()),
        temp_kf: double.parse(json['temp_kf'].toString()));
  }

  Map<String, dynamic> toJson()=>{
  'temp': temp,
  'feels_like': feels_like,
  'temp_min': temp_min,
  'temp_max': temp_max,
  'pressure': pressure,
  'sea_level': sea_level,
  'grnd_level': grnd_level,
  'humidity': humidity,
  'temp_kf': temp_kf
  };
}
