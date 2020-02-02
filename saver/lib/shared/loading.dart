import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: backGroundColor,
     child:Center(
       child:SpinKitPumpingHeart(
         color: Colors.red,
         size:70.0,
       ),
     )
    );
  }
}