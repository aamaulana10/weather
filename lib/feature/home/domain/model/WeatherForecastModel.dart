import 'package:myweather2/helper/ConvertHelper.dart';

class WeatherForecastModel {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherForecastModel(
      { this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.hourly,
        this.daily});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    lat = ConvertHelper.checkDouble(json['lat']);
    lon = ConvertHelper.checkDouble(json['lon']);
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly?.add(new Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily?.add(new Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    if (this.current != null) {
      data['current'] = this.current?.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly?.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  List<Weather>? weather;

  Current(
      { this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = ConvertHelper.checkDouble(json['temp']);
    feelsLike = ConvertHelper.checkDouble(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = ConvertHelper.checkDouble(json['dew_point']);
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = ConvertHelper.checkDouble(json['wind_speed']);
    windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather?.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    if (this.weather != null) {
      data['weather'] = this.weather?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({ this.id, this.main,  this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  Rain? rain;

  Hourly(
      {this.dt,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        this.weather,
        this.rain});

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = ConvertHelper.checkDouble(json['temp']);
    feelsLike = ConvertHelper.checkDouble(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = ConvertHelper.checkDouble(json['dew_point']);
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = ConvertHelper.checkDouble(json['wind_speed']);
    windDeg = json['wind_deg'];
    windGust = ConvertHelper.checkDouble(json['wind_gust']);
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather?.add(new Weather.fromJson(v));
      });
    }
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = ConvertHelper.checkDouble(this.windSpeed);
    data['wind_deg'] = this.windDeg;
    data['wind_gust'] = this.windGust;
    if (this.weather != null) {
      data['weather'] = this.weather?.map((v) => v.toJson()).toList();
    }
    if (this.rain != null) {
      data['rain'] = this.rain?.toJson();
    }
    return data;
  }

}

class Rain {
  double? d1h;

  Rain({this.d1h});

  Rain.fromJson(Map<String, dynamic> json) {
    d1h = ConvertHelper.checkDouble(json['1h']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1h'] = this.d1h;
    return data;
  }
}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  DailyTemp? temp;
  int? pressure;
  int? humidity;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;

  Daily(
      {this.dt,
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.temp,
        this.pressure,
        this.humidity,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        this.weather,
        this.clouds});

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = ConvertHelper.checkDouble(json['moon_phase']);
    temp = json['temp'] != null ? new DailyTemp.fromJson(json['temp']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    visibility = json['visibility'];
    windSpeed = ConvertHelper.checkDouble(json['wind_speed']);
    windDeg = json['wind_deg'];
    windGust = ConvertHelper.checkDouble(json['wind_gust']);
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather?.add(new Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    if (this.temp != null) {
      data['temp'] = this.temp?.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    data['wind_gust'] = this.windGust;
    if (this.weather != null) {
      data['weather'] = this.weather?.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this.clouds;
    return data;
  }
}

class DailyTemp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  DailyTemp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  DailyTemp.fromJson(Map<String, dynamic> json) {
    day = ConvertHelper.checkDouble(json['day']);
    min = ConvertHelper.checkDouble(json['min']);
    max = ConvertHelper.checkDouble(json['max']);
    night = ConvertHelper.checkDouble(json['night']);
    eve = ConvertHelper.checkDouble(json['eve']);
    morn = ConvertHelper.checkDouble(json['morn']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}