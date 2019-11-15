import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'c7af666da2a78fc516f0530ce55afdaa';
const url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityData(String cityName) async {
    const url = 'https://api.openweathermap.org/data/2.5/weather';
    NetworkHelper networkHelper =
        NetworkHelper(url: '$url?q=$cityName&appid=$apiKey&units=matrics');

    var networkdata = await networkHelper.getData();

    return networkdata;
  }

  Future<dynamic> getNetworkData() async {
    Location lo = Location();
    await lo.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$url?lat=${lo.latitude}&lon=${lo.longitude}&appid=$apiKey&units=matrics');

    var networkdata = await networkHelper.getData();

    return networkdata;
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
