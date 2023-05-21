import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.child }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black38),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: child,
        ),
    );
  }
}
