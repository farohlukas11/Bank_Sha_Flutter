import 'package:bank_sha/ui/pin/pin_page.dart';
import 'package:bank_sha/ui/topup/topup_success_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/theme.dart';
import '../widgets/buttons.dart';

class TopUpAmountPage extends StatefulWidget {
  static const routeName = '/top-up-amount';

  const TopUpAmountPage({super.key});

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);

        if (amountController.text == '') {
          amountController.text = '0';
        }
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
                  'Total Amount',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 67,
                ),
                Align(
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: amountController,
                      cursorColor: greyColor,
                      enabled: false,
                      style: whiteTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: medium,
                      ),
                      decoration: InputDecoration(
                        prefix: Text(
                          'Rp ',
                          style: whiteTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
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
                        addAmount('1');
                      },
                    ),
                    CustomInputButton(
                      number: '2',
                      onPressed: () {
                        addAmount('2');
                      },
                    ),
                    CustomInputButton(
                      number: '3',
                      onPressed: () {
                        addAmount('3');
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
                        addAmount('4');
                      },
                    ),
                    CustomInputButton(
                      number: '5',
                      onPressed: () {
                        addAmount('5');
                      },
                    ),
                    CustomInputButton(
                      number: '6',
                      onPressed: () {
                        addAmount('6');
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
                        addAmount('7');
                      },
                    ),
                    CustomInputButton(
                      number: '8',
                      onPressed: () {
                        addAmount('8');
                      },
                    ),
                    CustomInputButton(
                      number: '9',
                      onPressed: () {
                        addAmount('9');
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
                        addAmount('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () => deleteAmount(),
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
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Checkout Now',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, PinPage.routeName) ==
                        true) {
                      await launchUrl(Uri.parse('https://demo.midtrans.com/'));

                      Navigator.pushNamedAndRemoveUntil(context,
                          TopUpSuccessPage.routeName, (route) => false);
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Terms & Conditions',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
