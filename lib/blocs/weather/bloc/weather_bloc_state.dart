part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

class WeatherLoadingState extends WeatherBlocState {}

class WeatherLoaded extends WeatherBlocState {
  final Weather weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherBlocState {}
