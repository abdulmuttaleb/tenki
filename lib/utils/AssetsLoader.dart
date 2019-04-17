
class AssetsLoader{

  Map<String, String> images = Map();

  AssetsLoader(){
    images.putIfAbsent("clear sky", ()=>"assets/images/sunny.png");
    images.putIfAbsent("few clouds", ()=>"assets/images/cloudy-sunny.png");
    images.putIfAbsent("scattered clouds", ()=>"assets/images/cloudy.png");
    images.putIfAbsent("broken clouds", ()=>"assets/images/cloudy.png");
    images.putIfAbsent("shower rain", ()=>"assets/images/rainy.png");
    images.putIfAbsent("rain", ()=>"assets/images/rainy-sun.png");
    images.putIfAbsent("thunderstorm", ()=>"assets/images/cloudy-thunder.png");
    images.putIfAbsent("snow", ()=>"assets/images/snowy.png");
    images.putIfAbsent("mist", ()=>"assets/images/sunny-foggy");
  }


}