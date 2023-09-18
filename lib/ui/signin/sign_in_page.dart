import 'package:bank_sha/common/shared_method.dart';
import 'package:bank_sha/common/theme.dart';
import 'package:bank_sha/data/models/signin_form_model.dart';
import 'package:bank_sha/ui/home/home_page.dart';
import 'package:bank_sha/ui/signin/bloc/sign_in_bloc.dart';
import 'package:bank_sha/ui/signup/sign_up_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/sign-in';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool _validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInError) {
            showCustomSnackBar(context, state.error);
          } else if (state is SignInHasData) {
            debugPrint(state.model.toJson().toString());
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is SignInLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Container(
                  width: 155,
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_logo_light.png'),
                    ),
                  ),
                ),
                Text(
                  'Sign In &\nGrow Your Finance',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    children: [
                      //EMAIL INPUT
                      CustomFormField(
                        title: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      //PASSWORD INPUT
                      CustomFormField(
                        title: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password',
                          style: blueTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (_validate()) {
                            context.read<SignInBloc>().add(
                                  OnSignInEvent(
                                    SignInFormModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackBar(
                                context, 'Semua field harus diisi!');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  child: CustomTextButton(
                    title: 'Create New Account',
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
