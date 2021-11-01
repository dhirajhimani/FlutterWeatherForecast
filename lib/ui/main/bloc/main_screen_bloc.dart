import 'dart:async';

import 'package:weatherforecast/data/model/internal/application_error.dart';
import 'package:weatherforecast/data/model/internal/geo_position.dart';
import 'package:weatherforecast/data/model/remote/weather_forecast_list_response.dart';
import 'package:weatherforecast/data/model/remote/weather_response.dart';
import 'package:weatherforecast/data/repository/local/location_manager.dart';
import 'package:weatherforecast/data/repository/local/application_local_repository.dart';
import 'package:weatherforecast/data/repository/local/weather_local_repository.dart';
import 'package:weatherforecast/data/repository/remote/weather_remote_repository.dart';
import 'package:weatherforecast/ui/main/bloc/main_screen_event.dart';
import 'package:weatherforecast/ui/main/bloc/main_screen_state.dart';
import 'package:weatherforecast/utils/app_logger.dart';
import 'package:weatherforecast/utils/date_time_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';


class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final LocationManager _locationManager;
  final WeatherLocalRepository _weatherLocalRepository;
  final WeatherRemoteRepository _weatherRemoteRepository;
  final ApplicationLocalRepository _applicationLocalRepository;
  Timer? _refreshTimer;

  MainScreenBloc(
      this._locationManager,
      this._weatherLocalRepository,
      this._weatherRemoteRepository,
      this._applicationLocalRepository,
      ) : super(InitialMainScreenState());

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {

  }

  @override
  Future<void> close() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
    return super.close();
  }
}
