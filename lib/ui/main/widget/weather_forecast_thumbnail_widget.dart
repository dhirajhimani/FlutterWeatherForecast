import 'package:weatherforecast/data/model/internal/weather_forecast_holder.dart';
import 'package:weatherforecast/data/repository/local/weather_helper.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_bloc.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecastThumbnailWidget extends StatefulWidget {
  final WeatherForecastHolder _holder;
  final bool _isMetricUnits;

  const WeatherForecastThumbnailWidget(
    this._holder,
    this._isMetricUnits, {
    Key? key,
  }) : super(key: key);

  @override
  _WeatherForecastThumbnailWidgetState createState() =>
      _WeatherForecastThumbnailWidgetState();
}

class _WeatherForecastThumbnailWidgetState
    extends State<WeatherForecastThumbnailWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Dhiraj');
  }
}
