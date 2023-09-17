import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/ui/signup/sign_up_success_page.dart';
import 'package:bank_sha/ui/signupktp/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/shared_method.dart';
import '../../common/theme.dart';
import '../widgets/buttons.dart';

class SignUpSetKtp extends StatefulWidget {
  static const routeName = '/sign-up-set-ktp';

  final SignUpFormModel model;

  const SignUpSetKtp({super.key, required this.model});

  @override
  State<SignUpSetKtp> createState() => _SignUpSetKtpState();
}

class _SignUpSetKtpState extends State<SignUpSetKtp> {
  XFile? selectedImage;

  bool _validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.model.toJson().toString());
    return Scaffold(
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            showCustomSnackBar(context, state.message);
          } else if (state is SignupHasData) {
            Navigator.pushNamedAndRemoveUntil(
                context, SignUpSuccessPage.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is SignupLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
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
                'Verify Your\nAccount',
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
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                          image: selectedImage != null
                              ? DecorationImage(
                                  image: FileImage(
                                    File(selectedImage!.path),
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                  'assets/ic_upload.png',
                                  width: 32,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Passport/ID Card',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (_validate()) {
                          context.read<SignupBloc>().add(
                                OnRegisterEvent(
                                  widget.model.copyWith(
                                    ktp: 'data:image/png;base64,${base64Encode(
                                      File(selectedImage!.path)
                                          .readAsBytesSync(),
                                    )}',
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackBar(
                              context, 'Gambar tidak boleh kosong!');
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: CustomTextButton(
                  title: 'Skip for Now',
                  onPressed: () {
                    context
                        .read<SignupBloc>()
                        .add(OnRegisterEvent(widget.model));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
