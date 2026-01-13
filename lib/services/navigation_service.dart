import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class Routes {
  static const String splashScreen = "/";
  static const String flightSearchScreen = "/flight-search";
  static const String flightListScreen = "/flight-list";
  static const String flightBookingScreen = "/flight-booking";
  static const String bookingSuccessScreen = "/booking-success";
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.flightSearchScreen:
        return MaterialPageRoute(builder: (_) => const FlightSearchScreen());
      case Routes.flightListScreen:
        return MaterialPageRoute(builder: (_) => const FlightListScreen());
      case Routes.flightBookingScreen:
        final flight = settings.arguments as Flight;
        return MaterialPageRoute(
          builder: (_) => FlightBookingScreen(flight: flight),
        );
      case Routes.bookingSuccessScreen:
        final booking = settings.arguments as Booking;
        return MaterialPageRoute(
          builder: (_) => BookingSuccessScreen(booking: booking),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
