import 'package:repalogic_flight_booking/utilities/common_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FlightProvider())],
      child: MaterialApp(
        title: 'Flight Booking',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().light,
        initialRoute: Routes.splashScreen,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationService.generateRoute,
      ),
    );
  }
}
