import 'package:get_it/get_it.dart';
import 'package:weatherapp_bloc/data/weather_api_client.dart';
import 'package:weatherapp_bloc/data/weather_repository.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}
