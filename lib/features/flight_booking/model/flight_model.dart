class Flight {
  final String id;
  final String airline;
  final String origin;
  final String destination;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final Duration? duration;
  final double price;
  final int availableSeats;
  final String flightNumber;

  Flight({
    required this.id,
    required this.airline,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    required this.availableSeats,
    required this.flightNumber,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      id: json['id'] ?? '',
      airline: json['airline'] ?? '',
      origin: json['origin'] ?? '',
      destination: json['destination'] ?? '',
      departureTime: json['departureTime'] != null
          ? DateTime.parse(json['departureTime'])
          : null,
      arrivalTime: json['arrivalTime'] != null
          ? DateTime.parse(json['arrivalTime'])
          : null,
      duration: json['duration'] != null
          ? Duration(minutes: json['duration'])
          : null,
      price: (json['price'] as num).toDouble(),
      availableSeats: json['availableSeats'] as int,
      flightNumber: json['flightNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'airline': airline,
      'origin': origin,
      'destination': destination,
      'departureTime': departureTime?.toIso8601String(),
      'arrivalTime': arrivalTime?.toIso8601String(),
      'duration': duration?.inMinutes,
      'price': price,
      'availableSeats': availableSeats,
      'flightNumber': flightNumber,
    };
  }
}
