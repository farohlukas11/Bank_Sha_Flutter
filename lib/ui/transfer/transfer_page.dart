import 'package:bank_sha/common/theme.dart';
import 'package:bank_sha/ui/transfer/bloc/search_user_bloc.dart';
import 'package:bank_sha/ui/transfer/bloc/text_field_bloc.dart';
import 'package:bank_sha/ui/transferamount/transfer_amount_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/recent_user_item.dart';
import 'package:bank_sha/ui/widgets/result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/shared_method.dart';

class TransferPage extends StatefulWidget {
  static const routeName = '/transfer';

  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildSearch(context),
          BlocBuilder<TextFieldBloc, TextFieldState>(
            builder: (context, state) {
              if (state.value == '') {
                return buildRecentUser();
              } else {
                return buildResult(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildSearch(BuildContext context) {
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
          BlocBuilder<TextFieldBloc, TextFieldState>(
            builder: (context, state) {
              return TextFormField(
                initialValue: state.value,
                onChanged: (value) {
                  context.read<TextFieldBloc>().add(OnValueChangedEvent(value));
                  context
                      .read<SearchUserBloc>()
                      .add(OnSearchUserEvent(state.value));
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
              );
            },
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

  Widget buildResult(BuildContext context) {
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
          BlocBuilder<SearchUserBloc, SearchUserState>(
            builder: (context, state) {
              if (state is SearchUserHasData) {
                var listUser = state.listModel;
                return GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  // to disable GridView's scrolling
                  shrinkWrap: true,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: List.generate(
                    listUser.length,
                    (index) => ResultUserItem(
                      imageUrl: listUser[index].profilePicture ?? '',
                      name: listUser[index].name ?? '',
                      username: listUser[index].username ?? '',
                      isVerified: listUser[index].verified == 1 ? true : false,
                    ),
                  ),
                );
              } else if (state is SearchUserHasEmpty) {
                return Text(
                  'Tidak ada Data!',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                );
              } else if (state is SearchUserError) {
                showCustomSnackBar(context, state.message);

                return Text(
                  state.message,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                );
              } else if (state is SearchUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
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
