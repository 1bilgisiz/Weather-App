import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/widget/weatherpage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wetaher App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Weatherpage(),
    );
  }
}
