class Coord{
  final double lon;
  final double lat;

  Coord({required this.lon,  required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(

    lon: double.parse(json["lon"].toString()),
    lat: double.parse(json["lat"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}