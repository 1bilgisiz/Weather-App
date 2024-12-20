import 'package:flutter/material.dart';

class MaxMinSicaklikWidget extends StatelessWidget {
  const MaxMinSicaklikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Maksimum ${24} C ",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "  Minimum ${12} C ",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
