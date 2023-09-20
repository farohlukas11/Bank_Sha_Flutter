import 'package:bank_sha/common/theme.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/ui/datapackage/data_package_page.dart';
import 'package:bank_sha/ui/datapackage/data_package_success_page.dart';
import 'package:bank_sha/ui/dataprovider/data_provider_page.dart';
import 'package:bank_sha/ui/editprofile/edit_profile_page.dart';
import 'package:bank_sha/ui/editprofile/profile_edit_success_page.dart';
import 'package:bank_sha/ui/home/bloc/get_user_bloc.dart';
import 'package:bank_sha/ui/home/home_page.dart';
import 'package:bank_sha/ui/onboarding/onboarding_page.dart';
import 'package:bank_sha/ui/pin/pin_page.dart';
import 'package:bank_sha/ui/profile/bloc/logout_bloc.dart';
import 'package:bank_sha/ui/profile/profile_page.dart';
import 'package:bank_sha/ui/profilepin/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/signin/bloc/sign_in_bloc.dart';
import 'package:bank_sha/ui/signin/sign_in_page.dart';
import 'package:bank_sha/ui/signup/bloc/check_email_bloc.dart';
import 'package:bank_sha/ui/signup/sign_up_page.dart';
import 'package:bank_sha/ui/signup/sign_up_success_page.dart';
import 'package:bank_sha/ui/signupktp/bloc/signup_bloc.dart';
import 'package:bank_sha/ui/signupktp/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/signupprofile/sign_up_set_profile_page.dart';
import 'package:bank_sha/ui/splash/bloc/get_token_bloc.dart';
import 'package:bank_sha/ui/splash/splash_page.dart';
import 'package:bank_sha/ui/topup/topup_page.dart';
import 'package:bank_sha/ui/topup/topup_success_page.dart';
import 'package:bank_sha/ui/topupamount/topup_amount_page.dart';
import 'package:bank_sha/ui/transfer/transfer_page.dart';
import 'package:bank_sha/ui/transfer/transfer_success_page.dart';
import 'package:bank_sha/ui/transferamount/transfer_amount_page.dart';
import 'package:flutter/material.dart';
import 'package:bank_sha/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<CheckEmailBloc>()),
        BlocProvider(create: (_) => di.locator<SignUpBloc>()),
        BlocProvider(create: (_) => di.locator<SignInBloc>()),
        BlocProvider(create: (_) => di.locator<GetTokenBloc>()),
        BlocProvider(create: (_) => di.locator<LogoutBloc>()),
        BlocProvider(create: (_) => di.locator<GetUserBloc>()),
      ],
      child: MaterialApp(
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
              final SignUpFormModel model =
                  settings.arguments as SignUpFormModel;
              return MaterialPageRoute(
                builder: (_) => SignUpSetProfile(
                  model: model,
                ),
                settings: settings,
              );
            case SignUpSetKtp.routeName:
              final SignUpFormModel model =
                  settings.arguments as SignUpFormModel;
              return MaterialPageRoute(
                builder: (_) => SignUpSetKtp(
                  model: model,
                ),
                settings: settings,
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
            case ProfileEditPinPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const ProfileEditPinPage(),
              );
            case ProfileEditSuccessPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const ProfileEditSuccessPage(),
              );
            case TopUpPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TopUpPage(),
              );
            case TopUpAmountPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TopUpAmountPage(),
              );
            case TopUpSuccessPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TopUpSuccessPage(),
              );
            case TransferPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TransferPage(),
              );
            case TransferAmountPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TransferAmountPage(),
              );
            case TransferSuccessPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TransferSuccessPage(),
              );
            case DataProviderPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const DataProviderPage(),
              );
            case DataPackagePage.routeName:
              return MaterialPageRoute(
                builder: (_) => const DataPackagePage(),
              );
            case DataPackageSuccessPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const DataPackageSuccessPage(),
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
      ),
    );
  }
}
