import 'package:bank_sha/ui/datapackage/data_package_success_page.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

import '../../common/theme.dart';
import '../pin/pin_page.dart';
import '../widgets/buttons.dart';

class DataPackagePage extends StatefulWidget {
  static const routeName = '/data-package';

  const DataPackagePage({super.key});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
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
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          _buildPhoneNumber(),
          _buildSelectPackage(),
        ],
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            onChanged: (value) {},
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: blueColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(12),
              hintText: '+628',
              hintStyle: greyTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectPackage() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            runSpacing: 2,
            spacing: 2,
            children: [
              PackageItem(
                gigaByte: '10',
                price: 218000,
              ),
              PackageItem(
                gigaByte: '25',
                price: 420000,
              ),
              PackageItem(
                gigaByte: '40',
                price: 2500000,
                isSelected: true,
              ),
              PackageItem(
                gigaByte: '99',
                price: 5000000,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: CustomFilledButton(
              title: 'Continue',
              onPressed: () async {
                if (await Navigator.pushNamed(context, PinPage.routeName) ==
                    true) {
                  Navigator.pushNamedAndRemoveUntil(context,
                      DataPackageSuccessPage.routeName, (route) => false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
