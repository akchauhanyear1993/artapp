import 'dart:async';
import 'dart:convert';

import 'package:example/image_pop/image_dart.dart';
import 'package:example/webservice/Constant.dart';
import 'package:example/webservice/Method.dart';
import 'package:example/webservice/PaintingListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tts_improved/flutter_tts_improved.dart';
import 'package:uuid/uuid.dart';


class ArtAppPage extends StatefulWidget {
  List<Arts> arts;

  ArtAppPage({@required this.arts, Uuid uuid});
  @override
  ExampleHorizontal createState() => ExampleHorizontal(arts: arts);
}

class ExampleHorizontal extends State<ArtAppPage>  {

  static const adUnitID = "ca-app-pub-3940256099942544/8135179316";
  final _nativeAdmob = NativeAdmob();
  List<Arts> listart;
  List<Arts> arts;
  int index;
  FlutterTtsImproved flutterTts = FlutterTtsImproved();
  TextEditingController textEditingController = TextEditingController();
  int lastupdate = 0;
  double max = 2;
  bool isplay ;
  bool isVisible ;
  double current  = 1;
  String playpause = "";
  bool isFav ;
  int currentIndex ;
  double edgefrom_top;
  ExampleHorizontal({@required this.arts});

  @override
  void initState(){
    _nativeAdmob.initialize(appID: "ca-app-pub-3940256099942544~3347511713");
    isplay = false;
    isVisible = false;
    listart = this.arts;
    isFav = false ;
    edgefrom_top = 400.0;
    currentIndex = 0;
    playpause = ImagePath.pause;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          if(orientation == Orientation.landscape){
            return  Container(
                color: Colors.black,
                child :
                Swiper(
                    index: currentIndex,
                    itemBuilder: (BuildContext context, int index) {
                      return  Row(children: <Widget>[
                        Expanded( flex: 10,child: Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder:
                                        (context) =>
                                        ImagePage(
                                            i3x : listart[index].image.i3x
                                        ),

                                    )
                                );
                              },
                              child : Align(
                                alignment: Alignment.center,
                                child : Image(
                                    image: NetworkImage(listart[index].image.i3x)
                                ),
                              )
                          ),
                        ) ),
                        Expanded(flex: 6,child:
                        Stack(children: <Widget>[
                          SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: MediaQuery.of(context).size.width,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      color: Colors.black, // Yellow
                                      height: 100,
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height:MediaQuery.of(context).size.height,
                                              alignment: Alignment.center,
                                              child: Text(
                                                listart[index].meta.title,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ,fontSize: 22),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                Container(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: new DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: new NetworkImage(
                                                                listart[index].image.i1x)
                                                        )
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    listart[index].meta.artist +  ' • ' +  listart[index].meta.year + ' • ' + listart[index].meta.place ,
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white ,fontSize: 12),
                                                  ),
                                                )
                                              ])

                                          ),
                                        ],
                                      )
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Divider(
                                            color: Colors.white
                                        ),
                                      ) ),
                                  Container(
                                    color: Colors.black,
                                    margin: EdgeInsets.only(top: 20),
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Column(children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if(isFav == false){
                                                    listart[index].user.likes = (int.parse(listart[index].user.likes) + 1).toString() ;
                                                    isFav = true;
                                                  }
                                                  else {
                                                    listart[index].user.likes = (int.parse(listart[index].user.likes) - 1).toString() ;
                                                    isFav = false;
                                                  }

                                                });
                                              } ,
                                              child:  SvgPicture.asset(
                                                  isFav == true ? "assets/images/Heart-Active.svg" : "assets/images/Heart-InActive.svg",
                                                  height: 20,
                                                  width: 20
                                              ),
                                            ),
                                            Text(
                                              listart[index].user.likes,
                                              textAlign: TextAlign.center,
                                              maxLines: 200,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 10),)
                                          ],) ,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Column(children: <Widget>[
                                              GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isVisible = true;
                                                      speak(index);
                                                    });

                                                  } ,
                                                  child:SvgPicture.asset(
                                                      isVisible == true ? "assets/images/Speaker-Active.svg" : "assets/images/Speaker-InActive.svg",
                                                      height: 20,
                                                      width: 20
                                                  )
                                              )
                                            ],)
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Column(children: <Widget>[
                                              GestureDetector(
                                                  onTap: () {
                                                    SystemChrome.setPreferredOrientations([
                                                      DeviceOrientation.portraitDown,
                                                      DeviceOrientation.portraitUp
                                                    ]);
                                                  } ,
                                                  child:  SvgPicture.asset(
                                                      "assets/images/Portrait.svg",
                                                      height: 23,
                                                      width: 23
                                                  )
                                              )
                                            ],)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Divider(
                                            color: Colors.white
                                        ),
                                      ) ),
                                  Container(
                                      alignment: Alignment.center,
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          listart[index].meta.description,
                                          textAlign: TextAlign.start,
                                          maxLines: 200,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),
                                        ),
                                      ) ),
                                  Container(
                                      height: 80
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Visibility(
                              visible: isVisible,
                              child: Container(
                                color: Colors.black,
                                height: 75,
                                child:   Column(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: GestureDetector(onTap: () {
                                                setState(() {
                                                  start_stop();
                                                });
                                              },
                                                  child: Image(
                                                      height: 13,
                                                      width: 13,
                                                      image: AssetImage(playpause))) ,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: Slider(
                                                    value: current,
                                                    min: 0,
                                                    max: max,
                                                    divisions: 100,
                                                    activeColor: Colors.white,
                                                    inactiveColor: Colors.white70,
                                                    label: '${current.round()}',
                                                    onChangeStart: (double newValue) {
                                                      setState(() {
                                                        current = newValue;
                                                        stop();
                                                      });
                                                    },
                                                    onChangeEnd:(double newValue)  {
                                                      setState(() {
                                                        speak(index);
                                                      });
                                                    },
                                                    onChanged: (double newValue) {
                                                      setState(() {
                                                        current = newValue;
                                                        lastupdate =  newValue.round();
                                                      });
                                                    },
                                                    semanticFormatterCallback: (double newValue) {
                                                      return '${newValue.round()}';
                                                    }
                                                )
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: GestureDetector(onTap: () {
                                                  setState(() {
                                                    isVisible = false;
                                                    lastupdate = 0;
                                                    flutterTts.stop();
                                                  });
                                                },child: SvgPicture.asset(
                                                    isVisible == true ? "assets/images/Speaker-Active.svg" : "assets/images/Speaker-InActive.svg",
                                                    height: 20,
                                                    width: 20
                                                ))
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                )
                                ,
                              ),
                            ),
                          )]))
                      ],);
                    },
                    onIndexChanged:(index){
                      setState(() {
                        flutterTts.stop();
                        current = 1.0;
                        lastupdate = 0;
                        isVisible = false;
                        currentIndex = index;
                        max = 2.0;
                      });
                    },
                    itemCount: listart.length ?? 0)
            );
          }
          else return Container(
              color: Colors.black,
              child :
              Stack(children: [
                Container(
                  child: Swiper(
                      index: currentIndex,
                      itemBuilder: (BuildContext context, int index) {
                        NetworkImage(listart[index].image.i3x).resolve(ImageConfiguration()).addListener(ImageStreamListener(onImage));
                        if(currentIndex == 2){
                          return  Column( children: <Widget>[ Expanded(flex: 1 , child: NativeAdmobBannerView(
                            adUnitID: adUnitID,
                            showMedia: true,
                            style: BannerStyle.light,
                            contentPadding: EdgeInsets.fromLTRB(9.0, 8.0, 8.0, 8.0),
                          )) ,
                            Expanded( flex: 1 ,child: NativeAdmobBannerView(
                              adUnitID: adUnitID,
                              showMedia: true,
                              style: BannerStyle.light,
                              contentPadding: EdgeInsets.fromLTRB(9.0, 8.0, 8.0, 8.0),
                            ))]);
                        }
                        else return SingleChildScrollView(
                          child: Stack(children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    alignment: Alignment.topCenter,
                                    child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder:
                                                  (context) =>
                                                  ImagePage(
                                                      i3x : listart[index].image.i3x
                                                  ),

                                              )
                                          );
                                        },
                                        child : Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              alignment: Alignment.topCenter,
                                              image: NetworkImage(listart[index].image.i3x),
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(top: edgefrom_top),
                                    color: Colors.black26, // Yellow
                                    height: 100,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height:MediaQuery.of(context).size.height,
                                            alignment: Alignment.center,
                                            child: Text(
                                              listart[index].meta.title,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ,fontSize: 28),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                              Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: new NetworkImage(
                                                              listart[index].image.i1x)
                                                      )
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Text(
                                                  listart[index].meta.artist +  ' • ' +  listart[index].meta.year + ' • ' +listart[index].meta.place ,
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                                ),
                                              )
                                            ])

                                        ),
                                      ],
                                    )
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    color: Colors.black26,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Divider(
                                          color: Colors.white
                                      ),
                                    ) ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  color: Colors.black26,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if(isFav == false){
                                                  GetMethod.updateLike(1).then((value) => {
                                                  });
                                                  listart[index].user.likes = (int.parse(listart[index].user.likes) + 1).toString() ;
                                                  isFav = true;
                                                }
                                                else {
                                                  GetMethod.updateLike(0).then((value) => {
                                                  });
                                                  listart[index].user.likes = (int.parse(listart[index].user.likes) - 1).toString() ;
                                                  isFav = false;
                                                }
                                              });
                                            } ,
                                            child: SvgPicture.asset(
                                                isFav == true ? "assets/images/Heart-Active.svg" : "assets/images/Heart-InActive.svg",
                                                height: 20,
                                                width: 20
                                            ),
                                          ),
                                          Text(
                                            listart[index].user.likes,
                                            textAlign: TextAlign.center,
                                            maxLines: 200,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 10),)
                                        ],) ,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Column(children: <Widget>[
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isVisible = true;
                                                    speak(index);
                                                  });

                                                } ,
                                                child: SvgPicture.asset(
                                                    isVisible == true ? "assets/images/Speaker-Active.svg" : "assets/images/Speaker-InActive.svg",
                                                    height: 20,
                                                    width: 20
                                                )
                                            )
                                          ],)
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Column(children: <Widget>[
                                            GestureDetector(
                                                onTap: () {
                                                  SystemChrome.setPreferredOrientations([
                                                    DeviceOrientation.landscapeRight,
                                                    DeviceOrientation.landscapeLeft
                                                  ]);
                                                } ,
                                                child: SvgPicture.asset(
                                                    "assets/images/Landscape.svg",
                                                    height: 15,
                                                    width: 15
                                                )
                                            ),
                                          ],)
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    color: Colors.black26,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Divider(
                                          color: Colors.white
                                      ),
                                    ) ),
                                Container(
                                    alignment: Alignment.center,
                                    color: Colors.black26,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        listart[index].meta.description,
                                        textAlign: TextAlign.start,
                                        maxLines: 200,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                      ),
                                    ) ),
                                Container(
                                    height: 80
                                )

                              ],
                            )])  ,

                        ) ;
                      },
                      onIndexChanged:(index){
                        setState(() {
                          flutterTts.stop();
                          current = 1.0;
                          lastupdate = 0;
                          isVisible = false;
                          max = 2.0;
                          currentIndex = index;
                          isFav = false;
                        });
                      },
                      itemCount: listart.length ?? 0
                  ),
                ),
                new Align(
                  alignment: Alignment.bottomRight,
                  child: Visibility(
                    visible: isVisible,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 4,
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          )
                        ],
                      ),
                      height: 75,
                      child:   Column(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(onTap: () {
                                      setState(() {
                                        start_stop();
                                      });
                                    },
                                        child: Image(
                                            height: 13,
                                            width: 13,
                                            image: AssetImage(playpause))) ,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Slider(
                                          value: current,
                                          min: 0,
                                          max: max,
                                          divisions: 100,
                                          activeColor: Colors.white,
                                          inactiveColor: Colors.white70,
                                          label: '${current.round()}',
                                          onChangeStart: (double newValue) {
                                            setState(() {
                                              current = newValue;
                                              stop();
                                            });
                                          },
                                          onChangeEnd:(double newValue)  {
                                            setState(() {
                                              speak(index);
                                            });
                                          },
                                          onChanged: (double newValue) {
                                            setState(() {
                                              current = newValue;
                                              lastupdate =  newValue.round();
                                            });
                                          },
                                          semanticFormatterCallback: (double newValue) {
                                            return '${newValue.round()}';
                                          }
                                      )
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(onTap: () {
                                        setState(() {
                                          isVisible = false;
                                          lastupdate = 0;
                                          flutterTts.stop();
                                        });
                                      } ,
                                          child: Image(
                                              height: 25,
                                              width: 25,
                                              image: AssetImage("assets/images/cancle.png")))
                                  ),
                                ],
                              )
                          )
                        ],
                      )
                      ,
                    ),
                  ),
                ),

              ],)
          );
        }),
      )
    );
  }
  speak(int index) async {
    playpause = ImagePath.pause;
    this.index = index;
    if(listart[index].meta.description.length != 0){
      max = listart[index].meta.description.length.toDouble();
      isplay = true;
      flutterTts.setSpeechRate(1.0);
      flutterTts.speak(listart[index].meta.description.substring(lastupdate,listart[index].meta.description.length-1).replaceAll(".", " "));
      flutterTts.setProgressHandler((String fullPhrase, int wordOffset, int endOfWordOffset, String currentWord) {
        setState(() {
          print(currentWord);
          print(fullPhrase);
          print(wordOffset);
          lastupdate =  (listart[index].meta.description.length -1) - (fullPhrase.length-1 ) + endOfWordOffset ;
          current = double.parse(lastupdate.toString());
          print(endOfWordOffset);
        });
      });
    }

  }
  stop(){
    playpause = ImagePath.play;
    isplay = false;
    flutterTts.stop();
  }
  start_stop(){
    if(isplay){
      isplay = false;
      stop();
    }else{
      isplay = true;
      speak(index);
    }
  }
  String setImage(int index) {
    if(isFav == true){
      return ImagePath.heart_red;
    }else{
      return ImagePath.heart;
    }
  }
  void onImage(ImageInfo image, bool synchronousCall) {
    if(synchronousCall){
      var h =  image.image.height;
      var w =  image.image.width;
      var r = image.image.width/image.image.height;
      print(h);
      print(w);
      print(r);
      if(r>1){
        edgefrom_top = (MediaQuery.of(context).size.width * h)/w ;
      }
    }
  }
}