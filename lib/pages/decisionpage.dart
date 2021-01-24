import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class decisionpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _decisionpage();
  }
}

class _decisionpage extends State<decisionpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
          color: const Color(0xffff4242),
        ),
        child: Row(
          children: <Widget>[
            Text(
              'Found : ',
              style: TextStyle(
                fontFamily: 'OCR-A',
                fontSize: 37,
                color: const Color(0xffffffff),
              ),
            ),
          ],
        )
      )
    );
  }
}