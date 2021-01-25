import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DecisionPage extends StatefulWidget {
  @override
  _DecisionPage createState() => _DecisionPage();
}

class _DecisionPage extends State<DecisionPage> {
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
        ),
      ),
    );
  }
}
