import 'package:bank_sha/common/shared_method.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/ui/signin/sign_in_page.dart';
import 'package:bank_sha/ui/signup/bloc/check_email_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/theme.dart';
import '../signupprofile/sign_up_set_profile_page.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign-up';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool _validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CheckEmailBloc, CheckEmailState>(
        listener: (context, state) {
          if (state is CheckEmailError) {
            showCustomSnackBar(context, state.message);
          } else if (state is CheckEmailHasData) {
            var result = state.data;

            if (!result) {
              Navigator.pushNamedAndRemoveUntil(
                  context, SignUpSetProfile.routeName, (route) => false);
            } else {
              showCustomSnackBar(context, 'Email sudah ada yang menggunakan!');
            }
          }
        },
        builder: (context, state) {
          if (state is CheckEmailLoading) {
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
                  margin: const EdgeInsets.symmetric(vertical: 75),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_logo_light.png'),
                    ),
                  ),
                ),
                Text(
                  'Join Us to Unlock\nYour Growth',
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
                      //FUllNAME INPUT
                      CustomFormField(
                        title: 'Full Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

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
                        title: 'Continue',
                        onPressed: () {
                          if (_validate()) {
                            context.read<CheckEmailBloc>().add(
                                  OnCheckEmailEvent(
                                    SignUpFormModel(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackBar(
                                context, 'Semua field harus diisi');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: CustomTextButton(
                    title: 'Sign In',
                    onPressed: () {
                      Navigator.pushNamed(context, SignInPage.routeName);
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
