import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class FlightDetailsCard extends StatelessWidget {
  final Flight flight;

  const FlightDetailsCard({super.key, required this.flight});

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  flight.airline,
                  style: context.textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  flight.flightNumber,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
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
                      Text(flight.origin, style: context.textTheme.bodyMedium),
                    ],
                  ),
                ),
                Icon(Icons.flight, color: AppColors.primaryColor),
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
                      Text(
                        flight.destination,
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Duration: ${flight.duration != null ? _formatDuration(flight.duration!) : ''}',
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
