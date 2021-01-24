import 'package:flutter/material.dart';
import 'package:sumrabthan_version01/pages/camerapage.dart';
import 'package:sumrabthan_version01/pages/home.dart';
import 'package:sumrabthan_version01/pages/scanpage.dart';

void main() => runApp(MyApp());
/*
void main(){
  runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: !kReleaseMode,
  ));
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
      routes: {'/scan_page' : (context) => scanpage()},//routes: {'/camera_page' : (context) => camerapage()},
    );
  }
}
