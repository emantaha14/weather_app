class Wind{
  final double speed;
  final int deg;
  final double gust;

  Wind({required this.speed,
    required this.deg,
    required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json){
    return Wind(speed: double.parse(json['speed'].toString()),
        deg: int.parse(json['deg'].toString()),
        gust: double.parse(json['gust'].toString()));
  }
  Map<String, dynamic> toJson()=>{
    'speed':speed,
    'deg':deg,
    'gust':gust
  };
}
