import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  final String secilenSehir;

  const LocationPage({super.key, required this.secilenSehir});


  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ankara',
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
    );
  }
}
