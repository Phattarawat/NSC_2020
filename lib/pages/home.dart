import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homepage();
  }
}

class _homepage extends State<homepage> {
  String massage;
  var _kubkao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            //Image.asset('images/background.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: Text(
                    'SumrabThan',
                    style: TextStyle(
                      fontFamily: 'OCR-A',
                      fontSize: 37,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Container(
                      width: 230,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.5, color: const Color(0xff707070)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Searching...'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'OCR-A',
                              fontSize: 14,
                              color: const Color(0xff000000)),
                          controller: _kubkao,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Align(
                alignment: Alignment.center,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width,
                    viewportFraction: 0.725,
                    aspectRatio: 0.714561,
                    initialPage: 1,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'images/camerapopup.png',
                    'images/iconnbot.png',
                    'images/iconnorder.png'
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            massage = _kubkao.text;
                            (i == 'images/camerapopup.png')
                                ? Navigator.pushNamed(context, '/scan_page',
                                    arguments: _kubkao.text)
                                : print('Is not camera');
                          },
                          child: Container(
                            margin: EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('$i'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
