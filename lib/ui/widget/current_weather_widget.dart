import 'package:weatherforecast/data/model/remote/overall_weather_data.dart';
import 'package:weatherforecast/data/model/remote/weather_forecast_list_response.dart';
import 'package:weatherforecast/data/model/remote/weather_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weatherforecast/data/repository/local/weather_helper.dart';
import 'package:weatherforecast/ui/app/app_bloc.dart';
import 'package:weatherforecast/ui/widget/animated_state.dart';
import 'package:weatherforecast/ui/main/widget/weather_forecast_thumbnail_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherWidget extends StatefulWidget {
  final WeatherResponse? weatherResponse;
  final WeatherForecastListResponse? forecastListResponse;

  const CurrentWeatherWidget(
      {Key? key, this.weatherResponse, this.forecastListResponse})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CurrentWeatherWidgetState();
  }
}

class CurrentWeatherWidgetState extends AnimatedState<CurrentWeatherWidget> {

  @override
  Widget build(BuildContext context) {
    return Text('Dhiraj');
  }

  @override
  void onAnimatedValue(double value) {
    // TODO: implement onAnimatedValue
  }
}