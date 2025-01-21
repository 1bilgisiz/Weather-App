// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp_bloc/data/weather_repository.dart';
import 'package:weatherapp_bloc/locator.dart';
import 'package:weatherapp_bloc/models/weather.dart';
part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

final WeatherRepository weatherRepository = locator<WeatherRepository>();

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());

      try {
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.sehirAdi) as Weather;
        emit(WeatherLoaded(weather: getirilenWeather));
        weatherRepository.getWeather(event.sehirAdi);
      } catch (_) {
        emit(WeatherErrorState());
      }
    });
  }
}
