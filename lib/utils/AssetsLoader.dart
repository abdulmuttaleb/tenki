
class AssetsLoader{

  Map<String, String> images = Map();

  AssetsLoader(){
    images.putIfAbsent("Thunderstorm", ()=>"assets/images/cloudy-thunder.png");
    images.putIfAbsent("Drizzle", ()=>"assets/images/rainy.png");
    images.putIfAbsent("Rain", ()=>"assets/images/rainy-sun.png");
    images.putIfAbsent("Snow", ()=>"assets/images/snowy.png");
    images.putIfAbsent("Clear", ()=>"assets/images/sunny.png");
    images.putIfAbsent("Clouds", ()=>"assets/images/cloudy.png");
    images.putIfAbsent("Mist", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Smoke", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Haze", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Dust", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Fog", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Sand", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Ash", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Squall", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent("Tornado", ()=>"assets/images/sunny-foggy");
    images.putIfAbsent(null, ()=>"assets/images/rainy.png");

  }


}