import 'package:repalogic_flight_booking/utilities/common_exports.dart';

enum FlightState { idle, loading, loaded, error }

enum BookingState { idle, loading, success, error }

class FlightController {
  final FlightService _flightService = FlightService();

  FlightState _state = FlightState.idle;
  BookingState _bookingState = BookingState.idle;
  List<Flight> _flights = [];
  String? _errorMessage;
  Booking? _booking;
  String? _bookingError;

  FlightState get state => _state;
  BookingState get bookingState => _bookingState;
  List<Flight> get flights => _flights;
  String? get errorMessage => _errorMessage;
  Booking? get booking => _booking;
  String? get bookingError => _bookingError;

  Function()? onStateChanged;
  Function()? onBookingStateChanged;

  Future<void> searchFlights(FlightSearch search) async {
    _state = FlightState.loading;
    _errorMessage = null;
    onStateChanged?.call();

    try {
      _flights = await _flightService.searchFlights(search);
      _state = FlightState.loaded;
      if (_flights.isEmpty) {
        _errorMessage = 'No flights found for your search criteria';
      }
    } catch (e) {
      _state = FlightState.error;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
    }

    onStateChanged?.call();
  }

  Future<void> bookFlight({
    required String flightId,
    required String passengerName,
    required String passengerEmail,
    required String passengerPhone,
    required int numberOfPassengers,
  }) async {
    _bookingState = BookingState.loading;
    _bookingError = null;
    onBookingStateChanged?.call();

    try {
      _booking = await _flightService.bookFlight(
        flightId: flightId,
        passengerName: passengerName,
        passengerEmail: passengerEmail,
        passengerPhone: passengerPhone,
        numberOfPassengers: numberOfPassengers,
      );
      _bookingState = BookingState.success;
    } catch (e) {
      _bookingState = BookingState.error;
      _bookingError = e.toString().replaceAll('Exception: ', '');
    }

    onBookingStateChanged?.call();
  }

  void resetBookingState() {
    _bookingState = BookingState.idle;
    _booking = null;
    _bookingError = null;
    onBookingStateChanged?.call();
  }

  void clearFlights() {
    _flights = [];
    _state = FlightState.idle;
    _errorMessage = null;
    onStateChanged?.call();
  }

  List<String> getPopularCities() {
    return _flightService.getPopularCities();
  }
}
