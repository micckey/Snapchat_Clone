import 'package:flutter/material.dart';

class Style {
  static Padding sectionTitle(String text) => Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ));
}
