
class Weather{
  var _weather;
  var _main;
  String _name;

  Weather();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get main => _main;

  set main(value) {
    _main = value;
  }

  get weather => _weather;

  set weather(value) {
    _weather = value;
  }

  get weatherMain => _weather['main'];

  get temp => _main['temp'];

  get minTemp => _main['temp_min'];

  get maxTemp => _main['temp_max'];

}