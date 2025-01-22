import 'package:weatherapp_bloc/data/weather_api_client.dart';
import 'package:weatherapp_bloc/locator.dart';
import 'package:weatherapp_bloc/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather?> getWeather(String sehir) async {
    return null;
  }
}
