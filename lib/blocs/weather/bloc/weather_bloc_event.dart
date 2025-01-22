part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherBlocEvent {
  final String sehirAdi;

  const FetchWeatherEvent({required this.sehirAdi});

  get city => null;
}
