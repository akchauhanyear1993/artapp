import 'dart:convert';

import 'package:example/webservice/Constant.dart';
import 'package:example/webservice/PaintingListResponse.dart';
import 'package:http/http.dart' as http;

class GetMethod {

  static Future<PaintingListResponse> getArtRequest() async {
    var body = {
      'userId': 'adas',
      'size': '1',
    };
    final response = await http.post(Uri.parse(APIS.getArt),body: json.encode(body),headers: {"Accept": "application/json" , "x-api-key" : "4ExdqkqfQN9s0SedG5d5w4VLU8fFJvyc12MbiDqN"});
    var responseData = json.decode(utf8.decode(response.bodyBytes));
    return PaintingListResponse.fromJson(responseData);
  }

  static Future<PaintingListResponse> updateLike(int like) async {
    var body = {
      "userId": "adsf",
      "artId" : "art1",
      "useraction" : {
        "like" : like,
        "seen" : 1
      }
    };
    final response = await http.post(Uri.parse(APIS.getArt),body: json.encode(body),headers: {"Accept": "application/json" , "x-api-key" : "4ExdqkqfQN9s0SedG5d5w4VLU8fFJvyc12MbiDqN"});
    var responseData = json.decode(utf8.decode(response.bodyBytes));
    return PaintingListResponse.fromJson(responseData);
  }




}