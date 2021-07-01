import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var kapikey = dotenv.env['API_KEY'].toString();
const kopenweather = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    var url = '$kopenweather?q=$cityname&appid=$kapikey&units=metric';
    NetworkHelper networkhelper = NetworkHelper(url);
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentlocation();

    NetworkHelper networkhelper = NetworkHelper(
        '$kopenweather?lat=${location.latitude}&lon=${location.longitude}&appid=$kapikey&units=metric');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
