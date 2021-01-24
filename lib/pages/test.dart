import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';

class scanpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _scanpage();
  }
}

class _scanpage extends State<scanpage> {
  var images;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xffff4242),
            ),
            child: ListView(
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13, 18, 13, 0),
                        child: Container(
                            width: 1055.0,
                            height: 640.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(150, 565, 150, 7),
                              child: Container(
                                width: 5.0,
                                height: 5.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
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
                            )
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(28, 8, 13, 6),
                          child: GestureDetector(
                            onTap: ()async{
                              images = await ImagePicker.pickImage(source: ImageSource.gallery);
                              setState(() {});
                            },
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: AssetImage("images/iconnbot.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                              child: (images != null)
                                  ? Image.file(images)
                                  : Container()
                          )
                      ),
                    ]
                )
              ],
            )
        )
    );
  }
}
