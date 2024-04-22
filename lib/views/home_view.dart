import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'NotoSerif',
              color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchView(),
              ));
            },
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: Colors.black,
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context , state){
          if (state is WeatherInitialState){
            return const NoWeatherBody();
          }else if(state is WeatherLoadedState){
            return WeatherInfoBody(weather: state.weatherModel,);
          }else {
            return const Text("oops there was as error");
          }
        },
      )
    );
  }
}
