import 'package:flutter/material.dart';
import 'package:sumrabthan_version01/pages/home.dart';
import 'package:dio/dio.dart';

class NetworkService{
  Future postData(String base64)async{
    Response response;
    Dio dio = new Dio();
    response = await dio.post("https://api.aiforthai.in.th/thaifood", options:
        Options(contentType: Headers.jsonContentType, headers: {"Apikey": "39b3QPzmWT05sNepB6EoUMwEXNaZt6o8"})
        , data: {"file": base64,});
    if (response.statusCode==200){
      print(response.data);
    }
  }
}