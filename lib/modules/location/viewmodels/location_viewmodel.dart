import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationViewmodel extends ChangeNotifier {
  Position? _lastPosition;
  double _totalDistance = 0.0;
  double _currentSpeed = 0.0;

  double get totalDistance => _totalDistance / 1000; // km
  double get currentSpeed => _currentSpeed * 3.6; // km/h

  bool _isHud = false;
  bool get isHud => _isHud;

  LocationViewmodel() {
    _init();
  }

  void toggleHud() {
    _isHud = !_isHud;
    notifyListeners();
  }

  Future<void> _init() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Servicio de localización deshabilitado");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permiso de localización denegado");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Permiso de localización denegado permanentemente");
      return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 1,
      ),
    ).listen((Position position) {
      _currentSpeed = position.speed;
      if (_lastPosition != null) {
        _totalDistance += Geolocator.distanceBetween(
          _lastPosition!.latitude,
          _lastPosition!.longitude,
          position.latitude,
          position.longitude,
        );
      }
      _lastPosition = position;
      notifyListeners();
    });
  }

  void reset() {
    _totalDistance = 0.0;
    _currentSpeed = 0.0;
    _lastPosition = null;
    notifyListeners();
  }
}
