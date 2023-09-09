import 'package:bank_sha/ui/onboarding/onboarding_page.dart';
import 'package:bank_sha/ui/signin/sign_in_page.dart';
import 'package:bank_sha/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case SplashPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const SplashPage(),
            );
          case OnboardingPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const OnboardingPage(),
            );
          case SignInPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const SignInPage(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found!'),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
