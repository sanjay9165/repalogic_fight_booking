import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class FlightListScreen extends StatelessWidget {
  const FlightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.availableFlightsTitle)),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Consumer<FlightProvider>(
          builder: (context, provider, child) {
            final controller = provider.controller;

            if (controller.state == FlightState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.state == FlightState.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: AppColors.error),
                    const SizedBox(height: 16),
                    Text(
                      controller.errorMessage ?? 'An error occurred',
                      style: context.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Try Again',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            }

            if (controller.flights.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flight_takeoff,
                      size: 64,
                      color: AppColors.lightGray,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      controller.errorMessage ?? 'No flights found',
                      style: context.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Search Again',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.flights.length,
              itemBuilder: (context, index) {
                final flight = controller.flights[index];
                return FlightCard(flight: flight);
              },
            );
          },
        ),
      ),
    );
  }
}
