import 'package:flutter/material.dart';
import 'package:saveme/theme/style.dart';

class NavigationButton extends StatefulWidget {
  final String navigate;
  final String name;
  final IconData icon;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function optionalAction;

  NavigationButton({
    @required this.navigate,
    @required this.name,
    @required this.icon,
    this.margin = const EdgeInsets.all(8.0),
    this.padding = const EdgeInsets.all(8.0),
    this.optionalAction,
  });
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
          color: defaultTheme.background,
          padding: widget.padding,
          onPressed: () {
            setState(() {
              if (widget.optionalAction != null) widget.optionalAction();
              Navigator.of(context).pushNamed(widget.navigate);
            });
          },
          child: Row(
            children: <Widget>[
              Icon(
                widget.icon,
                color: defaultTheme.mainColor,
              ),
              Text(
                " ${widget.name} ",
                style: TextStyle(
                  fontSize: 20,
                  color: defaultTheme.mainColor,
                ),
              ),
            ],
          ),
        ));
  }
}
