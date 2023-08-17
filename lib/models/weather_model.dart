import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeatherModel {
  Coord? coord;
  List<Weather?>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  WeatherModel copyWith({
    Coord? coord,
    List<Weather?>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherModel(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      rain: rain ?? this.rain,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (coord != null) {
      result.addAll({'coord': coord!.toMap()});
    }
    if (weather != null) {
      result.addAll({'weather': weather!.map((x) => x?.toMap()).toList()});
    }
    if (base != null) {
      result.addAll({'base': base});
    }
    if (main != null) {
      result.addAll({'main': main!.toMap()});
    }
    if (visibility != null) {
      result.addAll({'visibility': visibility});
    }
    if (wind != null) {
      result.addAll({'wind': wind!.toMap()});
    }
    if (rain != null) {
      result.addAll({'rain': rain!.toMap()});
    }
    if (clouds != null) {
      result.addAll({'clouds': clouds!.toMap()});
    }
    if (dt != null) {
      result.addAll({'dt': dt});
    }
    if (sys != null) {
      result.addAll({'sys': sys!.toMap()});
    }
    if (timezone != null) {
      result.addAll({'timezone': timezone});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (cod != null) {
      result.addAll({'cod': cod});
    }

    return result;
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      coord: map['coord'] != null ? Coord.fromMap(map['coord']) : null,
      weather: map['weather'] != null ? List<Weather?>.from(map['weather']?.map((x) => Weather?.fromMap(x))) : null,
      base: map['base'],
      main: map['main'] != null ? Main.fromMap(map['main']) : null,
      visibility: map['visibility']?.toInt(),
      wind: map['wind'] != null ? Wind.fromMap(map['wind']) : null,
      rain: map['rain'] != null ? Rain.fromMap(map['rain']) : null,
      clouds: map['clouds'] != null ? Clouds.fromMap(map['clouds']) : null,
      dt: map['dt']?.toInt(),
      sys: map['sys'] != null ? Sys.fromMap(map['sys']) : null,
      timezone: map['timezone']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      cod: map['cod']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: Coord.fromMap(json['coord']),
      weather: List<Weather>.from(json['weather'].map((x) => Weather.fromMap(x))),
      base: json['base'],
      main: Main.fromMap(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromMap(json['wind']),
      clouds: Clouds.fromMap(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromMap(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  @override
  String toString() {
    return 'WeatherModel(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, rain: $rain, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherModel &&
        other.coord == coord &&
        listEquals(other.weather, weather) &&
        other.base == base &&
        other.main == main &&
        other.visibility == visibility &&
        other.wind == wind &&
        other.rain == rain &&
        other.clouds == clouds &&
        other.dt == dt &&
        other.sys == sys &&
        other.timezone == timezone &&
        other.id == id &&
        other.name == name &&
        other.cod == cod;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        wind.hashCode ^
        rain.hashCode ^
        clouds.hashCode ^
        dt.hashCode ^
        sys.hashCode ^
        timezone.hashCode ^
        id.hashCode ^
        name.hashCode ^
        cod.hashCode;
  }
}

class Clouds {
  int? all;
  Clouds({
    this.all,
  });

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (all != null) {
      result.addAll({'all': all});
    }

    return result;
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));

  @override
  String toString() => 'Clouds(all: $all)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Clouds && other.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}

class Coord {
  double? lon;
  double? lat;
  Coord({
    this.lon,
    this.lat,
  });

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (lon != null) {
      result.addAll({'lon': lon});
    }
    if (lat != null) {
      result.addAll({'lat': lat});
    }

    return result;
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon']?.toDouble(),
      lat: map['lat']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source));

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coord && other.lon == lon && other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (temp != null) {
      result.addAll({'temp': temp});
    }
    if (feelsLike != null) {
      result.addAll({'feelsLike': feelsLike});
    }
    if (tempMin != null) {
      result.addAll({'tempMin': tempMin});
    }
    if (tempMax != null) {
      result.addAll({'tempMax': tempMax});
    }
    if (pressure != null) {
      result.addAll({'pressure': pressure});
    }
    if (humidity != null) {
      result.addAll({'humidity': humidity});
    }
    if (seaLevel != null) {
      result.addAll({'seaLevel': seaLevel});
    }
    if (grndLevel != null) {
      result.addAll({'grndLevel': grndLevel});
    }

    return result;
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp']?.toDouble(),
      feelsLike: map['feelsLike']?.toDouble(),
      tempMin: map['tempMin']?.toDouble(),
      tempMax: map['tempMax']?.toDouble(),
      pressure: map['pressure']?.toInt(),
      humidity: map['humidity']?.toInt(),
      seaLevel: map['seaLevel']?.toInt(),
      grndLevel: map['grndLevel']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity, seaLevel: $seaLevel, grndLevel: $grndLevel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Main &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel;
  }

  @override
  int get hashCode {
    return temp.hashCode ^ feelsLike.hashCode ^ tempMin.hashCode ^ tempMax.hashCode ^ pressure.hashCode ^ humidity.hashCode ^ seaLevel.hashCode ^ grndLevel.hashCode;
  }
}

class Rain {
  double? the1H;
  Rain({
    this.the1H,
  });

  Rain copyWith({
    double? the1H,
  }) {
    return Rain(
      the1H: the1H ?? this.the1H,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (the1H != null) {
      result.addAll({'the1H': the1H});
    }

    return result;
  }

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      the1H: map['the1H']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) => Rain.fromMap(json.decode(source));

  @override
  String toString() => 'Rain(the1H: $the1H)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rain && other.the1H == the1H;
  }

  @override
  int get hashCode => the1H.hashCode;
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (type != null) {
      result.addAll({'type': type});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (sunrise != null) {
      result.addAll({'sunrise': sunrise});
    }
    if (sunset != null) {
      result.addAll({'sunset': sunset});
    }

    return result;
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type']?.toInt(),
      id: map['id']?.toInt(),
      country: map['country'],
      sunrise: map['sunrise']?.toInt(),
      sunset: map['sunset']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) => Sys.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sys(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sys && other.type == type && other.id == id && other.country == country && other.sunrise == sunrise && other.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^ id.hashCode ^ country.hashCode ^ sunrise.hashCode ^ sunset.hashCode;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (main != null) {
      result.addAll({'main': main});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (icon != null) {
      result.addAll({'icon': icon});
    }

    return result;
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt(),
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather && other.id == id && other.main == main && other.description == description && other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (speed != null) {
      result.addAll({'speed': speed});
    }
    if (deg != null) {
      result.addAll({'deg': deg});
    }
    if (gust != null) {
      result.addAll({'gust': gust});
    }

    return result;
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toDouble(),
      deg: map['deg']?.toInt(),
      gust: map['gust']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg, gust: $gust)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wind && other.speed == speed && other.deg == deg && other.gust == gust;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode ^ gust.hashCode;
}
