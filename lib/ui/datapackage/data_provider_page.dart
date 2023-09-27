import 'package:bank_sha/common/shared_method.dart';
import 'package:bank_sha/ui/datapackage/data_package_page.dart';
import 'package:bank_sha/ui/widgets/provider_item.dart';
import 'package:flutter/material.dart';

import '../../common/theme.dart';
import '../widgets/buttons.dart';

class DataProviderPage extends StatelessWidget {
  static const routeName = '/data-provider';

  const DataProviderPage({super.key});

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
          'Beli Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          _buildFromWallet(),
          _buildSelectProvider(context),
        ],
      ),
    );
  }

  Widget _buildFromWallet() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From Wallet',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
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
                    'Balance: ${formatCurrency(180000000)}',
                    textAlign: TextAlign.start,
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectProvider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const ProviderItem(
            image: 'assets/img_provider_telkomsel.png',
            name: 'Telkomsel',
            isSelected: true,
          ),
          const ProviderItem(
            image: 'assets/img_provider_indosat.png',
            name: 'Indosat',
          ),
          const ProviderItem(
            image: 'assets/img_provider_singtel.png',
            name: 'Singtel ID',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, DataPackagePage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
