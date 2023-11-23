import 'package:bank_sha/common/theme.dart';
import 'package:bank_sha/ui/home/home_page.dart';
import 'package:bank_sha/ui/onboarding/onboarding_page.dart';
import 'package:bank_sha/ui/splash/bloc/get_token_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetTokenBloc>(context).add(OnGetTokenEvent());

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocConsumer<GetTokenBloc, GetTokenState>(
        builder: (context, state) {
          return Center(
            child: Container(
              width: 155,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_dark.png'),
                  fit: BoxFit.fill,
                ),
              ),
            )
                .animate()
                .fadeIn(
                  duration: const Duration(seconds: 2),
                )
                .slide(),
          );
        },
        listener: (context, state) {
          late String routeName;
          if (state is GetTokenEmpty) {
            routeName = OnboardingPage.routeName;
          } else if (state is GetTokenHasData) {
            routeName = HomePage.routeName;
          }

          Navigator.pushNamedAndRemoveUntil(
              context, routeName, (route) => false);
        },
      ),
    );
  }
}
