import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'package:sumrabthan_version01/pages/imagetrns.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPage createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  File images;
  String _img64;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xffff4242),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 42, 13, 0),
              child: (images != null)
                  ? Image.file(images)
                  : Container(
                      width: 955.0,
                      height: 627.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29.0),
                        color: const Color(0xffffffff),
                      ),
                    ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 20.0,
                  height: 10.0,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 30.0,
                  height: 40.0,
                ),
                GestureDetector(
                  onTap: () async {
                    final pickedFile =
                        await picker.getImage(source: ImageSource.gallery);
                    setState(() {
                      if (pickedFile != null) {
                        images = File(pickedFile.path);
                        print(images);
                      } else {
                        print('No image selected.');
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    width: 54.0,
                    height: 54.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage("images/gallerys.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 75,
                ),
                GestureDetector(
                  onTap: () async {
                    final pickedFile =
                      await picker.getImage(source: ImageSource.camera);
                    setState(() {
                      if (pickedFile != null) {
                        images = File(pickedFile.path);
                        final byte = images.readAsBytesSync();
                        _img64 = base64Encode(byte);
                        print(images);
                        print(_img64);
                      } else {
                        print('No image selected.');
                      }
                    });


                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/camera.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xfffdde58),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    if (_img64 != null) {
                      NetworkService().postData(_img64);
                    }
                  } ,
                  child: Text(
                    'Submit'
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
