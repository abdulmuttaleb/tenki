
import 'dart:core';
class Weather{

  static final Weather _singleton = new Weather._internal();
  var mainWeather='';
  double mainTemp=0, minTemp=0, maxTemp=0;
  String name='';
  int lastSaved=0;

  factory Weather(){
    return _singleton;
  }

  Weather._internal();

  @override
  String toString() {
    return mainWeather.toString() + ","
        + mainTemp.toString()+","
        + minTemp.toString()+","
        + maxTemp.toString()+","
        + name+","
        +lastSaved.toString();
  }


}