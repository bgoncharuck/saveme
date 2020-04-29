import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  String navigate;
  String name;
  IconData icon;
  Color backgroundColor;
  Color color;
  EdgeInsets margin;
  EdgeInsets padding;

  NavigationButton({
    String navigate = "/",
    String name = "Home",
    IconData icon = Icons.home,
    Color backgroundColor = Colors.blueAccent,
    Color color = Colors.white,
    EdgeInsets margin = const EdgeInsets.all(8.0),
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) {
    this.navigate = navigate;
    this.name = name;
    this.icon = icon;
    this.backgroundColor = backgroundColor;
    this.color = color;
    this.margin = margin;
    this.padding = padding;
  }
  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.margin,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          padding: widget.padding,
          color: widget.backgroundColor,
          textColor: widget.color,
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed(widget.navigate);
            });
          },
          child: Row(
            children: <Widget>[
              Icon(
                widget.icon,
                color: widget.color,
              ),
              Text(" ${widget.name} "),
            ],
          ),
        ));
  }
}
