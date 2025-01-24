import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/blocs/weather/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp_bloc/widget/havadurumu.dart';
import 'package:weatherapp_bloc/widget/location.dart';
import 'package:weatherapp_bloc/widget/maxminsicaklik.dart';
import 'package:weatherapp_bloc/widget/sehirsec.dart';
import 'package:weatherapp_bloc/widget/songuncelleme.dart';

// ignore: must_be_immutable
class Weatherpage extends StatelessWidget {
  String kullanicininSectigiSehir = "Ankara";

  Weatherpage({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBlocBloc>(context);

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
            onPressed: () async {
              kullanicininSectigiSehir = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SehirSecWidget()));
              if (kullanicininSectigiSehir != null) {
                _weatherBloc
                    .add(FetchWeatherEvent(sehirAdi: kullanicininSectigiSehir));
              }
            },
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: Colors.white70,
          )
        ],
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => _weatherBloc,
          child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
            builder: (context, state) {
              if (state is WeatherBlocInitial) {
                return const Center(
                  child: Text("Lütfen şehir seçiniz"),
                );
              } else if (state is WeatherLoaded) {
               // final getirilenWeather = state.weather;

                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LocationPage(
                          secilenSehir: kullanicininSectigiSehir,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: SonguncellemeWidget()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: HavaDurumuResimWidget()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: MaxMinSicaklikWidget()),
                    ),
                  ],
                );
              } else if (state is WeatherErrorState) {
                return const Center(
                  child: Text("Hata oluştu"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
