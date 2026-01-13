import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class BookingSuccessScreen extends StatelessWidget {
  final Booking booking;

  const BookingSuccessScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.bookingSuccessTitle)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withAlpha(26),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 60,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Booking Confirmed!',
                style: context.textTheme.displayLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Your flight has been successfully booked',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRow(
                        label: 'Booking ID',
                        value: booking.id,
                        context: context,
                      ),
                      const Divider(),
                      DetailRow(
                        label: 'Passenger Name',
                        value: booking.passengerName,
                        context: context,
                      ),
                      const Divider(),
                      DetailRow(
                        label: 'Email',
                        value: booking.passengerEmail,
                        context: context,
                      ),
                      const Divider(),
                      DetailRow(
                        label: 'Phone',
                        value: booking.passengerPhone,
                        context: context,
                      ),
                      const Divider(),
                      DetailRow(
                        label: 'Number of Passengers',
                        value: '${booking.numberOfPassengers}',
                        context: context,
                      ),
                      const Divider(),
                      DetailRow(
                        label: 'Total Amount',
                        value: '₹${booking.totalPrice.toStringAsFixed(0)}',
                        context: context,
                        isHighlight: true,
                      ),
                      const Divider(),
                      DetailRow(
                        label: 'Booking Date',
                        value: booking.bookingDate != null
                            ? DateFormat(
                                AppConstants.dateTimeFormat,
                              ).format(booking.bookingDate!)
                            : '',
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Book Another Flight',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.flightSearchScreen,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
