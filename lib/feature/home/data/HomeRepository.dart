import 'dart:convert';

import 'package:myweather2/feature/home/domain/model/WeatherForecastModel.dart';
import 'package:myweather2/helper/ApiConfig.dart';
import 'package:http/http.dart' as http;

class HomeRepository {

  Future<WeatherForecastModel> getCurrentWeatherByLatLong(String latitude, String longitude) async{

    var url = ApiConfig.baseUrl + "onecall?&units=metric&exclude=minutely&appid="
        + ApiConfig.apiKey + "&lat=" + latitude + "&lon=" + longitude + "&lang=en";

    print(url);

    try {

      var response = await http .get(Uri.parse(url));
      final data = json.decode(response.body) ;
      var forecast = WeatherForecastModel.fromJson(data);

      return forecast;

    } catch(e) {
      print("error when getting weather ${e.toString()}");
      throw e;
    }
  }
}