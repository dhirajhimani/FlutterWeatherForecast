
import 'package:flutter/material.dart';
import 'package:weatherforecast/data/model/remote/system.dart';

class WeatherMainSunPathWidget extends StatefulWidget {
  final System? system;

  const WeatherMainSunPathWidget({Key? key, this.system}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherMainSunPathWidgetState();
}

class _WeatherMainSunPathWidgetState extends State<WeatherMainSunPathWidget> {

  @override
  Widget build(BuildContext context) {
    return Text('Dhiraj');
  }
}