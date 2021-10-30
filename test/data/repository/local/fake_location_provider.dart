import 'package:geolocator/geolocator.dart';
import 'package:weatherforecast/data/repository/local/location_provider.dart';

///Fake location provider which always return fake data.
class FakeLocationProvider extends LocationProvider {
  LocationPermission _locationPermission = LocationPermission.always;

  LocationPermission _requestedLocationPermission = LocationPermission.always;
  bool _locationEnabled = true;

  @override
  Future<Position> providePosition() async {
    return Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: DateTime.now(),
        altitude: 0.0,
        accuracy: 0.0,
        heading: 0.0,
        floor: 0,
        speed: 0.0,
        speedAccuracy: 0.0);
  }

  @override
  Future<bool> isLocationEnabled() async {
    return _locationEnabled;
  }

  @override
  Future<LocationPermission> checkLocationPermission() async {
    return _locationPermission;
  }

  @override
  Future<LocationPermission> requestLocationPermission() async {
    return _requestedLocationPermission;
  }

  // ignore: avoid_setters_without_getters
  set locationPermission(LocationPermission value) {
    _locationPermission = value;
  }

  // ignore: avoid_setters_without_getters
  set locationEnabled(bool value) {
    _locationEnabled = value;
  }

  // ignore: avoid_setters_without_getters
  set requestedLocationPermission(LocationPermission value) {
    _requestedLocationPermission = value;
  }
}
