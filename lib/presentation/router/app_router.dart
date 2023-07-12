import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../screens/colors_palette_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/provider_countrol.dart';
import '../screens/stream_builder_counter.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const ColorsPaletteScreen();

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
      case colorsPaletteScreen:
        return MaterialPageRoute(builder: (_) => const ColorsPaletteScreen());

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