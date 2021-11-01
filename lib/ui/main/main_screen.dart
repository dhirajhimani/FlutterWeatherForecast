import 'package:weatherforecast/data/model/internal/application_error.dart';
import 'package:weatherforecast/data/model/internal/overflow_menu_element.dart';
import 'package:weatherforecast/data/model/remote/weather_forecast_list_response.dart';
import 'package:weatherforecast/data/model/remote/weather_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weatherforecast/resources/config/application_colors.dart';
import 'package:weatherforecast/resources/config/dimensions.dart';
import 'package:weatherforecast/resources/config/ids.dart';
import 'package:weatherforecast/ui/app/app_bloc.dart';
import 'package:weatherforecast/ui/app/app_event.dart';
import 'package:weatherforecast/ui/main/bloc/main_screen_bloc.dart';
import 'package:weatherforecast/ui/main/bloc/main_screen_event.dart';
import 'package:weatherforecast/ui/main/bloc/main_screen_state.dart';
import 'package:weatherforecast/ui/main/widget/weather_main_sun_path_widget.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_bloc.dart';
import 'package:weatherforecast/ui/navigation/bloc/navigation_event.dart';
import 'package:weatherforecast/ui/widget/animated_gradient.dart';
import 'package:weatherforecast/ui/widget/current_weather_widget.dart';
import 'package:weatherforecast/ui/widget/loading_widget.dart';
import 'package:weatherforecast/ui/widget/widget_helper.dart';
import 'package:weatherforecast/utils/app_logger.dart';
import 'package:weatherforecast/utils/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:app_settings/app_settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<String, Widget?> _pageMap = <String, Widget?>{};
  late AppBloc _appBloc;
  late MainScreenBloc _mainScreenBloc;
  late NavigationBloc _navigationBloc;
  
  
  @override
  Widget build(BuildContext context) {
    return Text('Dhiraj');
  }
}
