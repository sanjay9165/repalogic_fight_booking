import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.flightSearchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff, size: 80, color: AppColors.white),
            const SizedBox(height: 24),
            Text(
              'Flight Booking',
              style: context.textTheme.displayLarge?.copyWith(
                color: AppColors.white,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
