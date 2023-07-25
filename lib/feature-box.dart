import 'package:beetle/pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final String boxDesc;
  final Color boxColor;
  final String boxTitle;

  const FeatureBox({super.key, required this.boxDesc, required this.boxColor, required this.boxTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(boxTitle, style: Pallete.titleStyle,),
          Text(boxDesc, style: Pallete.textStyle1,),
        ],
      ),
    );
  }
}