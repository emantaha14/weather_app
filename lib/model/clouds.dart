class Clouds{
  final int all;
  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json){
    return Clouds(all: int.parse(json['all'].toString()));
  }

  Map<String, dynamic> toJson()=>{
    'all':all
  };
}