import 'package:flutter/material.dart';
import 'package:flutter_weather/utils/Color.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainBlue = HexColor("#4E78FF");
  Color yellow = HexColor("#ECE800");

  bool _value = false;
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
                        new Image.asset("assets/images/sunny.png",
                            width: 128.0,
                            height: 128.0),
                        new Container(
                          padding: EdgeInsets.only(top: 32.0),
                          child: new Column(
                            children: <Widget>[
                              new Text("Clear",
                                style: new TextStyle(
                                    fontSize: 34.0,
                                    color: Colors.white
                                ),),
                              new Padding(padding: EdgeInsets.all(4.0)),
                              new Text("25°",
                                style: new TextStyle(
                                    fontSize: 34.0,
                                    color: Colors.white
                                ),),
                              new Padding(padding: EdgeInsets.all(4.0)),
                              new Text("26 / 18°C",
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
              )

            ],
          )
        ),
    );
  }
}