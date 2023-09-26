import 'package:bank_sha/common/shared_method.dart';
import 'package:bank_sha/common/theme.dart';
import 'package:bank_sha/ui/editprofile/edit_profile_page.dart';
import 'package:bank_sha/ui/pin/pin_page.dart';
import 'package:bank_sha/ui/profile/bloc/logout_bloc.dart';
import 'package:bank_sha/ui/profilepin/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/signin/sign_in_page.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/bloc/get_user_bloc.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetUserBloc>(context).add(OnGetUserEvent());

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
          'My Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(
              vertical: 22,
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                BlocBuilder<GetUserBloc, GetUserState>(
                  builder: (context, state) {
                    if (state is GetUserHasData) {
                      var data = state.model;

                      return Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  data.profilePicture ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: data.verified == 1
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 27,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check_circle,
                                          color: greenColor,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            data.name ?? '',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Kesalahan memuat Profile User!',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      );
                    }
                  },
                ),
                ProfileMenuItem(
                  image: 'assets/ic_edit_profile.png',
                  title: 'Edit Profile',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const PinPage(nextRoute: EditProfilePage.routeName),
                      ),
                    );
                  },
                ),
                ProfileMenuItem(
                  image: 'assets/ic_pin.png',
                  title: 'My PIN',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PinPage(
                            nextRoute: ProfileEditPinPage.routeName),
                      ),
                    );
                  },
                ),
                ProfileMenuItem(
                  image: 'assets/ic_wallet.png',
                  title: 'Wallet Settings',
                  onPressed: () {},
                ),
                ProfileMenuItem(
                  image: 'assets/ic_my_rewards.png',
                  title: 'My Rewards',
                  onPressed: () {},
                ),
                ProfileMenuItem(
                  image: 'assets/ic_help.png',
                  title: 'Help Center',
                  onPressed: () {},
                ),
                BlocConsumer<LogoutBloc, LogoutState>(
                  listener: (context, state) {
                    if (state is LogoutError) {
                      showCustomSnackBar(context, 'Gagal melakukan Logout!');
                    } else if (state is LogoutSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignInPage.routeName, (route) => false);
                    }
                  },
                  builder: (context, state) {
                    if (state is LogoutLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ProfileMenuItem(
                      image: 'assets/ic_logout.png',
                      title: 'Log Out',
                      onPressed: () {
                        context.read<LogoutBloc>().add(OnLogOutEvent());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'Report a Problem',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
