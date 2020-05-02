import 'package:flutter/material.dart';

class MainNumber extends StatefulWidget {
  @override
  _MainNumberState createState() => _MainNumberState();
}

class _MainNumberState extends State<MainNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.all(1.0),
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("/numbers/add");
          });
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 1.0,
                bottom: 1.0,
                left: 10.0,
                right: 2.0,
              ),
              child: Icon(
                Icons.smartphone,
                color: Colors.black,
                size: 32.0,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      " +380960123456 ",
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.file_download,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
