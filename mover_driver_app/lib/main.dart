import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mover_driver_app/screens/onbording_screen.dart';
import 'package:provider/provider.dart';
import 'providers/map_provider.dart';
import 'providers/user_provider.dart';
import 'screens/cash_earned_screen.dart';
import 'screens/completed_trip_screen.dart';
import 'screens/login_signup_screen.dart';
import 'screens/map_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MoverDriverApp());
}

class MoverDriverApp extends StatelessWidget {
  const MoverDriverApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MapProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mover Driver App',
        initialRoute: OnboardingScreen.route,
        theme: theme,
        routes: {
          OnboardingScreen.route: (_) => const OnboardingScreen(),
          LoginSignupScreen.route: (_) => const LoginSignupScreen(),
          MapScreen.route: (_) => const MapScreen(),
          CompletedTripsScreen.route: (_) => const CompletedTripsScreen(),
          CashEarnedScreen.route: (_) => const CashEarnedScreen(),
        },
      ),
    );
  }
}
