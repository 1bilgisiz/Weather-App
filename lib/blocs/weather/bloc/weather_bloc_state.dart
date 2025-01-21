part of 'weather_bloc_bloc.dart';

/// Sealed class to represent various states of the Weather Bloc.
sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

/// Initial state when the weather data is not yet fetched.
final class WeatherBlocInitial extends WeatherBlocState {}

/// State when weather data is being loaded.
class WeatherLoadingState extends WeatherBlocState {}

/// State when the weather data is successfully loaded.
class WeatherLoaded extends WeatherBlocState {
  final Weather weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

/// State when there is an error while fetching weather data.
class WeatherErrorState extends WeatherBlocState {}
