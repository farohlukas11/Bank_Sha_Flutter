import 'package:bank_sha/common/shared/theme.dart';
import 'package:bank_sha/ui/editprofile/edit_profile_page.dart';
import 'package:bank_sha/ui/home/home_page.dart';
import 'package:bank_sha/ui/onboarding/onboarding_page.dart';
import 'package:bank_sha/ui/pin/pin_page.dart';
import 'package:bank_sha/ui/profile/profile_page.dart';
import 'package:bank_sha/ui/signin/sign_in_page.dart';
import 'package:bank_sha/ui/signup/sign_up_page.dart';
import 'package:bank_sha/ui/signup/sign_up_success_page.dart';
import 'package:bank_sha/ui/signupktp/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/signupprofile/sign_up_set_profile_page.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
            size: 20,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
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
          case SignUpPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const SignUpPage(),
            );
          case SignUpSetProfile.routeName:
            return MaterialPageRoute(
              builder: (_) => const SignUpSetProfile(),
            );
          case SignUpSetKtp.routeName:
            return MaterialPageRoute(
              builder: (_) => const SignUpSetKtp(),
            );
          case SignUpSuccessPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const SignUpSuccessPage(),
            );
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (_) => const HomePage(),
            );
          case ProfilePage.routeName:
            return MaterialPageRoute(
              builder: (_) => const ProfilePage(),
            );
          case PinPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const PinPage(),
            );
          case EditProfilePage.routeName:
            return MaterialPageRoute(
              builder: (_) => const EditProfilePage(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Page not found!',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
