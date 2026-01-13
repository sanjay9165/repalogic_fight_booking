import 'package:flutter/material.dart';
import 'package:repalogic_flight_booking/features/flight_booking/controller/flight_controller.dart';

class FlightProvider extends ChangeNotifier {
  final FlightController _controller = FlightController();

  FlightController get controller => _controller;

  FlightProvider() {
    _controller.onStateChanged = () => notifyListeners();
    _controller.onBookingStateChanged = () => notifyListeners();
  }
}
