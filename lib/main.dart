import 'package:repalogic_flight_booking/utilities/common_exports.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      initialRoute: Routes.splashScreen,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: NavigationService.generateRoute,
    );
  }
}
