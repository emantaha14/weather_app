import 'package:flutter/cupertino.dart';

class WeatherProvider extends ChangeNotifier{
   String? city = "Mansoura";
   changeSearchResult(String city){
      this.city = city;
      notifyListeners();
   }
}