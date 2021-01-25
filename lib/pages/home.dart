import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sumrabthan_version01/pages/scan_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String massage;
  var _kubkao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
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
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: TextField(
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 16,
                      ),
                      border: InputBorder.none,
                      hintText: 'Searching...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
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
                  ].map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              (i == 'images/camerapopup.png')
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ScanPage(),
                                      ),
                                    )
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
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
