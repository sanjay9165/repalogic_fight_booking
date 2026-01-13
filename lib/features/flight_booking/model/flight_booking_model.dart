import 'package:repalogic_flight_booking/utilities/app_extension.dart';

class Booking {
  final String id;
  final String flightId;
  final String passengerName;
  final String passengerEmail;
  final String passengerPhone;
  final int numberOfPassengers;
  final double totalPrice;
  final DateTime? bookingDate;

  Booking({
    required this.id,
    required this.flightId,
    required this.passengerName,
    required this.passengerEmail,
    required this.passengerPhone,
    required this.numberOfPassengers,
    required this.totalPrice,
    required this.bookingDate,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] ?? '',
      flightId: json['flightId'] ?? '',
      passengerName: json['passengerName'] ?? '',
      passengerEmail: json['passengerEmail'] ?? '',
      passengerPhone: json['passengerPhone'] ?? '',
      numberOfPassengers: json['numberOfPassengers'] ?? 0,
      totalPrice: (json['totalPrice'] ?? '0').toString().toDouble(),
      bookingDate: json['bookingDate'] != null
          ? DateTime.parse(json['bookingDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'flightId': flightId,
      'passengerName': passengerName,
      'passengerEmail': passengerEmail,
      'passengerPhone': passengerPhone,
      'numberOfPassengers': numberOfPassengers,
      'totalPrice': totalPrice,
      'bookingDate': bookingDate?.toIso8601String(),
    };
  }
}
