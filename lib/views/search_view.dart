import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 27),
        title: const Text(
          'Search City',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'NotoSerif',
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Center(
          child: TextField(
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            // بتستقبل قيمة
            onSubmitted: (value) async {
           var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              labelText: 'Search',
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSerif',
              ),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


