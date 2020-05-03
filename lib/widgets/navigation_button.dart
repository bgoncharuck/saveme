import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';

class NavigationButton extends StatefulWidget {
  String navigate;
  String name;
  IconData icon;
  EdgeInsets margin;
  EdgeInsets padding;
  Function optionalAction;

  NavigationButton({
    @required String navigate,
    @required String name,
    @required IconData icon,
    EdgeInsets margin = const EdgeInsets.all(8.0),
    EdgeInsets padding = const EdgeInsets.all(8.0),
    optionalAction,
  }) {
    this.navigate = navigate;
    this.name = name;
    this.icon = icon;
    this.margin = margin;
    this.padding = padding;
    this.optionalAction = optionalAction;
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
            borderRadius: new BorderRadius.circular(32.0),
          ),
          color: DefaultTheme.scaffoldBackgroundColor,
          padding: widget.padding,
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed(widget.navigate);
              if (widget.optionalAction != null) widget.optionalAction();
            });
          },
          child: Row(
            children: <Widget>[
              Icon(
                widget.icon,
                color: DefaultTheme.buttonColor,
              ),
              Text(
                " ${widget.name} ",
                style: TextStyle(
                  fontSize: 20,
                  color: DefaultTheme.buttonColor,
                ),
              ),
            ],
          ),
        ));
  }
}
