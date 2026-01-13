import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class FlightService {
  Future<List<Flight>> searchFlights(FlightSearch search) async {
    await Future.delayed(const Duration(seconds: 1));

    return MokeData.mockFlights.where((flight) {
      final isOriginMatch =
          flight.origin.toLowerCase() == search.origin.toLowerCase();
      final isDestinationMatch =
          flight.destination.toLowerCase() == search.destination.toLowerCase();
      final isDateMatch =
          flight.departureTime?.year == search.date.year &&
          flight.departureTime?.month == search.date.month &&
          flight.departureTime?.day == search.date.day;

      return isOriginMatch && isDestinationMatch && isDateMatch;
    }).toList();
  }

  Future<Flight?> getFlightById(String flightId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return MokeData.mockFlights.firstWhere((flight) => flight.id == flightId);
    } catch (e) {
      return null;
    }
  }

  Future<Booking> bookFlight({
    required String flightId,
    required String passengerName,
    required String passengerEmail,
    required String passengerPhone,
    required int numberOfPassengers,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final flight = await getFlightById(flightId);
    if (flight == null) {
      throw Exception('Flight not found');
    }

    if (flight.availableSeats < numberOfPassengers) {
      throw Exception('Not enough seats available');
    }

    final booking = Booking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      flightId: flightId,
      passengerName: passengerName,
      passengerEmail: passengerEmail,
      passengerPhone: passengerPhone,
      numberOfPassengers: numberOfPassengers,
      totalPrice: flight.price * numberOfPassengers,
      bookingDate: DateTime.now(),
    );

    return booking;
  }

  List<String> getPopularCities() {
    return [
      'Mumbai',
      'Delhi',
      'Bangalore',
      'Kolkata',
      'Chennai',
      'Hyderabad',
      'Pune',
      'Ahmedabad',
    ];
  }
}
