import 'package:bank_sha/ui/home/home_page.dart';
import 'package:bank_sha/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';

import '../../common/theme.dart';
import '../widgets/buttons.dart';

class TransferSuccessPage extends StatelessWidget {
  static const routeName = '/transfer-success';

  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Berhasil Transfer',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Use the money wisely and\ngrow your finance',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              title: 'Back to Home',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePage.routeName, (route) => false);
              },
              width: 183,
            ),
          ],
        ),
      ),
    );
  }
}
