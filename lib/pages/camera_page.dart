import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPage createState() => _CameraPage();
}

class _CameraPage extends State<CameraPage> {
  var image;

  @override
  Widget build(BuildContext context) {
    String argkubkao = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                argkubkao,
                style: TextStyle(
                  fontFamily: 'OCR A',
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(170, 10, 170, 0),
            child: RaisedButton(
              child: Text('Open camera'),
              onPressed: () async {
                (argkubkao == 'camera')
                    ? image =
                        await ImagePicker.pickImage(source: ImageSource.camera)
                    : image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                setState(() {});
              },
            ),
          ),
          (image != null) ? Image.file(image) : Container()
        ],
      ),
    );
  }
}
