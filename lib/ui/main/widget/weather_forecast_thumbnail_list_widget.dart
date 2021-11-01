import 'package:weatherforecast/data/model/internal/weather_forecast_holder.dart';
import 'package:weatherforecast/data/model/remote/system.dart';
import 'package:weatherforecast/data/model/remote/weather_forecast_list_response.dart';
import 'package:weatherforecast/data/model/remote/weather_forecast_response.dart';
import 'package:weatherforecast/data/repository/local/weather_helper.dart';
import 'package:weatherforecast/ui/app/app_bloc.dart';
import 'package:weatherforecast/ui/main/widget/weather_forecast_thumbnail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecastThumbnailListWidget extends StatefulWidget {
  final System? system;
  final WeatherForecastListResponse? forecastListResponse;

  const WeatherForecastThumbnailListWidget(
      {Key? key, this.system, this.forecastListResponse})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WeatherForecastThumbnailListWidgetState();
  }
}

class WeatherForecastThumbnailListWidgetState
    extends State<WeatherForecastThumbnailListWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Dhiraj');
  }
}
