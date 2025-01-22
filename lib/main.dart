import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/blocs/weather/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp_bloc/locator.dart';
import 'package:weatherapp_bloc/widget/weatherpage.dart';

Future<void> main(List<String> args) async {
  setUpLocator();
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
      home: BlocProvider(
        create: (context) => WeatherBlocBloc(),
        child: Weatherpage(),
      ),
    );
  }
}
