import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/common/shared_method.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/ui/signupktp/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/theme.dart';
import '../widgets/buttons.dart';

class SignUpSetProfile extends StatefulWidget {
  static const routeName = '/sign-up-set-profile';
  final SignUpFormModel model;

  const SignUpSetProfile({
    super.key,
    required this.model,
  });

  @override
  State<SignUpSetProfile> createState() => _SignUpSetProfileState();
}

class _SignUpSetProfileState extends State<SignUpSetProfile> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool _validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.model.toJson().toString());

    return Scaffold(
      body: ListView(
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
            margin: const EdgeInsets.only(bottom: 50),
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
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (_validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpSetKtp(
                              model: widget.model.copyWith(
                                pin: pinController.text,
                                profilePicture: selectedImage != null
                                    ? 'data:image/png;base64,${base64Encode(
                                        File(selectedImage!.path)
                                            .readAsBytesSync(),
                                      )}'
                                    : null,
                              ),
                            ),
                          ),
                          (route) => false);
                    } else {
                      showCustomSnackBar(context, 'PIN harus 6 Digit!');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
