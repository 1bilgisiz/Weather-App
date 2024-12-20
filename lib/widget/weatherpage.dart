import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/widget/havadurumu.dart';
import 'package:weatherapp_bloc/widget/location.dart';
import 'package:weatherapp_bloc/widget/maxminsicaklik.dart';
import 'package:weatherapp_bloc/widget/sehirsec.dart';
import 'package:weatherapp_bloc/widget/songuncelleme.dart';

class Weatherpage extends StatelessWidget {
  const Weatherpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(
              color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SehirSecWidget()));
            },
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: Colors.white70,
          )
        ],
      ),
      body: Center(
          child: ListView(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: LocationPage()),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: SonguncellemeWidget()),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: HavaDurumuResimWidget()),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: MaxMinSicaklikWidget()),
          ),
        ],
      )),
    );
  }
}
