import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class FlightBookingScreen extends StatefulWidget {
  final Flight flight;

  const FlightBookingScreen({super.key, required this.flight});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  int _numberOfPassengers = 1;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _bookFlight() {
    if (_formKey.currentState!.validate()) {
      context.read<FlightProvider>().bookFlight(
        flightId: widget.flight.id,
        passengerName: _nameController.text.trim(),
        passengerEmail: _emailController.text.trim(),
        passengerPhone: _phoneController.text.trim(),
        numberOfPassengers: _numberOfPassengers,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.bookFlightTitle)),
      body: Consumer<FlightProvider>(
        builder: (context, provider, child) {
          final controller = provider;

          if (controller.bookingState == BookingState.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(
                context,
                Routes.bookingSuccessScreen,
                arguments: controller.booking,
              );
              controller.resetBookingState();
            });
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlightDetailsCard(flight: widget.flight),
                  const SizedBox(height: 24),
                  Text(
                    'Passenger Details',
                    style: context.textTheme.displayLarge?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Passenger Name',
                    hintText: 'Enter passenger name',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppConstants.emptyNameError;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Email',
                    hintText: 'Enter email address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppConstants.emptyEmailError;
                      }
                      if (!value.emailValidation) {
                        return AppConstants.invalidEmailError;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Phone Number',
                    hintText: 'Enter phone number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppConstants.emptyPhoneError;
                      }
                      if (!value.isValidPhone) {
                        return AppConstants.invalidPhoneError;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Number of Passengers',
                    style: context.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: _numberOfPassengers > 1
                            ? () {
                                setState(() {
                                  _numberOfPassengers--;
                                });
                              }
                            : null,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        '$_numberOfPassengers',
                        style: context.textTheme.displayMedium?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed:
                            _numberOfPassengers < widget.flight.availableSeats
                            ? () {
                                setState(() {
                                  _numberOfPassengers++;
                                });
                              }
                            : null,
                        color: AppColors.primaryColor,
                      ),
                      const Spacer(),
                      Text(
                        'Total: ₹${(widget.flight.price * _numberOfPassengers).toStringAsFixed(0)}',
                        style: context.textTheme.displayMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  if (controller.bookingState == BookingState.error) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.error),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: AppColors.error),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              controller.bookingError ?? 'Booking failed',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Confirm Booking',
                    onPressed: controller.bookingState == BookingState.loading
                        ? null
                        : _bookFlight,
                    isLoading: controller.bookingState == BookingState.loading,
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
