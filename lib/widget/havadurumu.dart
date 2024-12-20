import 'package:flutter/material.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/image/1.png'),
            width: 200,
            height: 200,
          ),
          Text(
            "Hava Durumu",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
