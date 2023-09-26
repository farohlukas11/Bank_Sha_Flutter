import 'package:bank_sha/common/shared_method.dart';
import 'package:bank_sha/ui/home/home_page.dart';
import 'package:bank_sha/ui/topup/bloc/topup_method_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/theme.dart';
import '../widgets/buttons.dart';

class TopUpSuccessPage extends StatelessWidget {
  static const routeName = '/topup-success';

  const TopUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TopupMethodBloc, TopupMethodState>(
        builder: (context, state) {
          if (state is TopupMethodGetData) {
            context
                .read<TopupMethodBloc>()
                .add(OnTopUpMethodEvent(state.model));
          }

          return BlocConsumer<TopupMethodBloc, TopupMethodState>(
            listener: (context, state) async {
              if (state is TopupMethodError) {
                showCustomSnackBar(context, 'Gagal melakukan TopUp!');
              } else if (state is TopupMethodHasData) {
                await launchUrl(Uri.parse(state.paymentUrl));
                debugPrint(state.paymentUrl);
              }
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Top Up\nWallet Berhasil',
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
              );
            },
          );
        },
      ),
    );
  }
}
