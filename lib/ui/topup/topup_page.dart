import 'package:bank_sha/common/theme.dart';
import 'package:bank_sha/ui/home/bloc/get_user_bloc.dart';
import 'package:bank_sha/ui/topupamount/topup_amount_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/topup_bank_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpPage extends StatelessWidget {
  static const routeName = '/top-up';

  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildWallet(),
          buildSelectBank(context),
        ],
      ),
    );
  }

  Widget buildWallet() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 55,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/img_bg_card.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              BlocBuilder<GetUserBloc, GetUserState>(
                builder: (context, state) {
                  if (state is GetUserHasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.model.cardNumber ?? '',
                          textAlign: TextAlign.start,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.model.name ?? '',
                          textAlign: TextAlign.start,
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSelectBank(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TopUpBankItem(
            image: 'assets/img_bank_bca.png',
            name: 'BANK BCA',
            isSelected: true,
            onTap: () {},
          ),
          TopUpBankItem(
            image: 'assets/img_bank_bni.png',
            name: 'Bank BNI',
            onTap: () {},
          ),
          TopUpBankItem(
            image: 'assets/img_bank_mandiri.png',
            name: 'BANK MANDIRI',
            onTap: () {},
          ),
          TopUpBankItem(
            image: 'assets/img_bank_ocbc.png',
            name: 'BANK OCBC',
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 30,
            ),
            child: CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, TopUpAmountPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
