import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:saveme/constants.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitPumpingHeart(
            color: defaultTheme.mainColor,
            size: 128,
          ),
        ),
      ),
    );
  }
}
