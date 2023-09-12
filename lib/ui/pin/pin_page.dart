import 'dart:math';

import 'package:bank_sha/common/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  static const routeName = '/pin';

  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text == '123123') {
      Navigator.pop(context, true);
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 58,
              vertical: 36,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sha PIN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: pinController,
                    obscureText: true,
                    cursorColor: greyColor,
                    obscuringCharacter: '*',
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 16,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 66,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInputButton(
                      number: '1',
                      onPressed: () {
                        addPin('1');
                      },
                    ),
                    CustomInputButton(
                      number: '2',
                      onPressed: () {
                        addPin('2');
                      },
                    ),
                    CustomInputButton(
                      number: '3',
                      onPressed: () {
                        addPin('3');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInputButton(
                      number: '4',
                      onPressed: () {
                        addPin('4');
                      },
                    ),
                    CustomInputButton(
                      number: '5',
                      onPressed: () {
                        addPin('5');
                      },
                    ),
                    CustomInputButton(
                      number: '6',
                      onPressed: () {
                        addPin('6');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInputButton(
                      number: '7',
                      onPressed: () {
                        addPin('7');
                      },
                    ),
                    CustomInputButton(
                      number: '8',
                      onPressed: () {
                        addPin('8');
                      },
                    ),
                    CustomInputButton(
                      number: '9',
                      onPressed: () {
                        addPin('9');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 60,
                      height: 60,
                    ),
                    CustomInputButton(
                      number: '0',
                      onPressed: () {
                        addPin('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () => deletePin(),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: numberBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
