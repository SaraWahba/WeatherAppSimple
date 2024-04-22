import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      useMaterial3: false,
                      primarySwatch: getThemeColor(
                          BlocProvider.of<GetWeatherCubit>(context)
                              .weatherModel
                              ?.weatherCondition),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: HomeView(),
                  );
                },
              )),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Ice pellets':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    default:
      return Colors.blue; // Default color
  }
}
