import 'package:Tenki/models/Weather.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ApiHelper.dart';
class DataLoader{

  final _endpointUrl = "api.openweathermap.org";
  var weather = new Weather();
  Position userPosition;
  DataLoader();

  Future checkIfDataSaved() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSaved = prefs.getBool("saved");
    if(isSaved==null || !isSaved){
      _getUserLocation();
    }else{
      _getSavedData().then((_) {
        if(weather.lastSaved == null){
          _getUserLocation();
        }else {
          Duration diff = DateTime.now().difference(
              DateTime.fromMillisecondsSinceEpoch(weather.lastSaved));
          if(diff.inHours > 2){
            _getUserLocation();
          }
        }
      });
    }
  }

  Future _getUserLocation() async{
    await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((onValue){
      print(onValue);
      userPosition = onValue;
      _fetchWeatherData();
    });
  }

  Future _getSavedData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weather.mainWeather = prefs.getString("main");
    weather.mainTemp = prefs.getDouble("temp");
    weather.minTemp = prefs.getDouble("temp_min");
    weather.maxTemp = prefs.getDouble('temp_max');
    weather.lastSaved = prefs.getInt("time_saved");
    weather.name = prefs.getString("name");
    print("Fetched saved data successfully!");
  }

  _saveData () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('main', weather.mainWeather);
    prefs.setDouble('temp', weather.mainTemp);
    prefs.setDouble('temp_min', weather.minTemp);
    prefs.setDouble('temp_max', weather.maxTemp);
    prefs.setInt('time_saved', weather.lastSaved);
    prefs.setString('name', weather.name);
    prefs.setBool("saved", true);
    print("saved data successfully!");
  }

  _fetchWeatherData() async{
    var requestUri = new Uri.http(_endpointUrl,"/data/2.5/weather",{"lat":userPosition.latitude.toString(),"lon":userPosition.longitude.toString(),"appid":ApiHelper().apiKey});

    final response = await http.get(requestUri);
    if(response.statusCode == 200){
      final map = json.decode(response.body);
      print(map);
      _assignWeatherData(map);
      print(weather.toString());
    }else{
      print(response.body);
    }
  }

  _assignWeatherData(var map){
    final weatherMap = map["weather"];
    final weatherMain = map["main"];
    weatherMap.forEach((temp){
      weather.mainWeather = temp["main"];
    });
    weather.mainTemp = weatherMain["temp"];
    weather.minTemp = weatherMain["temp_min"];
    weather.maxTemp = weatherMain["temp_max"];
    weather.lastSaved = DateTime.now().millisecondsSinceEpoch;
    weather.name = map['name'];
    _saveData();
  }

}