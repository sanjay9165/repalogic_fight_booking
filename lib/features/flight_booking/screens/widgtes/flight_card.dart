import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;

  const FlightCard({super.key, required this.flight});

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.flightBookingScreen,
            arguments: flight,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flight.airline,
                          style: context.textTheme.displayLarge?.copyWith(
                            color: AppColors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          flight.flightNumber,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '₹${flight.price.toStringAsFixed(0)}',
                    style: context.textTheme.displayLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flight.departureTime != null
                              ? DateFormat(
                                  AppConstants.timeFormat,
                                ).format(flight.departureTime!)
                              : '',
                          style: context.textTheme.displayMedium?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          flight.origin,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.flight, color: AppColors.primaryColor),
                      Text(
                        flight.duration != null
                            ? _formatDuration(flight.duration!)
                            : '',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          flight.arrivalTime != null
                              ? DateFormat(
                                  AppConstants.timeFormat,
                                ).format(flight.arrivalTime!)
                              : '',
                          style: context.textTheme.displayMedium?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          flight.destination,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.event_seat, size: 16, color: AppColors.lightGray),
                  const SizedBox(width: 4),
                  Text(
                    '${flight.availableSeats} seats available',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
