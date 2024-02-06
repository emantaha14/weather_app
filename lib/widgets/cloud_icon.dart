import 'package:flutter/cupertino.dart';

Widget selectCloudIcon(int temp){
  if(temp >= 0 && temp <=10){
    return Image.asset('assets/images/cloud.png');
  }
  else if(temp >= 11 && temp <=30){
    return Image.asset('assets/images/cloudy.png');
  }
  else if(temp >= 31 && temp <=40){
    return Image.asset('assets/images/cloudy (1).png');
  }
  else if(temp >= 41 && temp <=60){
    return Image.asset('assets/images/sun.png');
  }
  else{
    return Image.asset('assets/images/cloud.png');
  }
}
