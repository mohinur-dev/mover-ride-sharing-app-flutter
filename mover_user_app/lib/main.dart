import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mover_user_app/screens/onboarding_sceen.dart';
import 'package:mover_user_app/screens/login_signup_screen.dart';
import 'package:provider/provider.dart';

import 'providers/map_provider.dart';
import 'providers/user_provider.dart';
import 'screens/map_screen.dart';
import 'screens/trips_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MoverUserApp());
}

class MoverUserApp extends StatelessWidget {
  const MoverUserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: MapProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mover User App',
        theme: theme,
        initialRoute: OnboardingScreen.route,
        routes: {
          OnboardingScreen.route: (_) => const OnboardingScreen(),
          MapScreen.route: (_) => const MapScreen(),
          LoginSignupScreen.route: (_) => const LoginSignupScreen(),
          TripsScreen.route: (_) => const TripsScreen(),
        },
      ),
    );
  }
}
