import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:photo_view/photo_view.dart';

class ImagePage extends StatefulWidget {

  String i3x;
  ImagePage({@required this.i3x});
  @override
  ImagePageState createState() => ImagePageState(i3x : i3x);
}

class ImagePageState extends State<ImagePage>  {
  String i3x;
  ImagePageState({@required this.i3x});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: (){
                  print("Container clicked");
                },
                child: PhotoView(
                  imageProvider: new NetworkImage(i3x),
                )
            )

        )
          ,Align(
            alignment: Alignment.topLeft,
            child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            color: Colors.black,
            icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          )],) ,
    );

  }


}