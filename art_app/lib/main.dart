import 'dart:async';
import 'package:example/swipe/swipe_page.dart';
import 'package:example/webservice/Method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';



void main() => runApp(
    RootRestorationScope(
        restorationId: 'root',
        child: MaterialApp( home: new MyHomePage())
    )
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>{
              GetMethod.getArtRequest().then((value) => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>
                        ArtAppPage(arts: value.arts , uuid : Uuid())
                    )
                )
               }
              )
            }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}


