class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTamp;
  final double minTamp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTamp,
      required this.minTamp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTamp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTamp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
