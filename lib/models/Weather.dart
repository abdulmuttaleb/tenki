
class Weather{

  static final Weather _singleton = new Weather._internal();

  var weather;
  var main;
  String name;
  int dt;

  factory Weather(){
    return _singleton;
  }

  Weather._internal();
}