import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/onboarding_screen.dart';
import '../presentation/screens/provider_countrol.dart';
import '../presentation/screens/stream_builder_counter.dart';


class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const ProviderCounter ();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case streamBuilderCounterScreen:
        return MaterialPageRoute(builder: (_) => const StreamBuilderCounter());
      case providerCounterScreen:
        return MaterialPageRoute(builder: (_) => const ProviderCounter());

      case homeScreen:
        final Map data = settings.arguments as Map;
        final String myName = data['name'];
        final String myPassword = data['password'];
        if (kDebugMode) {
          print(myPassword);
        }
        return MaterialPageRoute(builder: (_) => HomeScreen(myName: myName,));
      default:
        return null;
    }
  }
}