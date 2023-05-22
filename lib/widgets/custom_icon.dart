import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.child, required this.isCameraPage }) : super(key: key);
  final Widget child;
  final bool isCameraPage;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isCameraPage? Colors.black38 : Colors.white70),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: child,
        ),
    );
  }
}
