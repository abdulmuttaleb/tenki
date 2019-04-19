import 'package:Tenki/utils/DataLoader.dart';
import 'package:flutter/material.dart';
import 'package:Tenki/utils/Color.dart';
import 'package:Tenki/utils/AssetsLoader.dart';
import 'package:Tenki/models/Weather.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetsLoader _assetsLoader = new AssetsLoader();
  Color mainBlue = HexColor("#4E78FF");
  Color yellow = HexColor("#ECE800");
  bool _value = false;
  DataLoader dataLoader = new DataLoader();
  var weather = new Weather();
  void _unitOnChanged(bool value){
    setState(() {
      _value = value;
      if(value){
        print("F");
      }else{
        print("C");
      }
    });
  }

  @override
  void initState() {
      super.initState();
      dataLoader.checkIfDataSaved().then((_){
        setState(() {
          weather = dataLoader.weather;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: mainBlue ,
      body: new Container(
        padding: EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text("°C",
                    textAlign: TextAlign.end,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 12.0
                    ),
                  ),
                  new Switch(
                      inactiveThumbColor: yellow,
                      activeColor: yellow,
                      activeTrackColor: Colors.white.withOpacity(0.5),
                      inactiveTrackColor: Colors.white.withOpacity(0.5),
                      value: _value,
                      onChanged: (bool value){_unitOnChanged(value);}),
                  new Text("F",
                    textAlign: TextAlign.end,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 12.0
                    ),
                  ),
                ],
              ),
              new Container(
                  padding: EdgeInsets.only(top: 196.0),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Image.asset(weather.mainWeather==''?"assets/images/rainy.png":_assetsLoader.images[weather.mainWeather],
                            width: 128.0,
                            height: 128.0),
                        new Container(
                          padding: EdgeInsets.only(top: 32.0),
                          child: new Column(
                            children: <Widget>[
                              new Text(weather.mainWeather,
                                style: new TextStyle(
                                    fontSize: 34.0,
                                    color: Colors.white
                                ),),
                              new Padding(padding: EdgeInsets.all(4.0)),
                              new Text(_value?weather.mainTemp.toString() :weather.mainTemp.toString(),
                                style: new TextStyle(
                                    fontSize: 34.0,
                                    color: Colors.white
                                ),),
                              new Padding(padding: EdgeInsets.all(4.0)),
                              new Text(weather.maxTemp.toString()+"/ "+weather.minTemp.toString()+"°C",
                                style: new TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),)
                            ],
                          )
                          ,
                        )
                      ],
                    ),
                  )
              ),
            ],
          )
        ),
    );
  }
}