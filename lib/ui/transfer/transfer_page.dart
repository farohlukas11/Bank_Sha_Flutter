import 'package:bank_sha/common/shared/theme.dart';
import 'package:bank_sha/ui/transferamount/transfer_amount_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/recent_user_item.dart';
import 'package:bank_sha/ui/widgets/result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  static const routeName = '/transfer';

  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController searchController =
      TextEditingController(text: '');

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
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildSearch(),
          if (searchController.text == '') buildRecentUser() else buildResult(),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                searchController.text = value;
              });
            },
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
              hintText: 'by username',
              hintStyle: greyTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const RecentUserItem(
            imageUrl: 'assets/img_photo1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true,
          ),
          const RecentUserItem(
            imageUrl: 'assets/img_photo3.png',
            name: 'John Hi',
            username: 'jhi',
          ),
          const RecentUserItem(
            imageUrl: 'assets/img_phot4.png',
            name: 'Masayoshi',
            username: 'form',
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ResultUserItem(
                imageUrl: 'assets/img_profile.png',
                name: 'Yonna Jie',
                username: 'yoenna',
                isVerified: true,
              ),
              ResultUserItem(
                imageUrl: 'assets/img_photo2.png',
                name: 'Yonne Ka',
                username: 'yoenyu',
                onSelected: true,
              ),
            ],
          ),
          const SizedBox(
            height: 244,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, TransferAmountPage.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
