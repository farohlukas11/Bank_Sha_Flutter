import 'package:bank_sha/common/shared/theme.dart';
import 'package:bank_sha/ui/editprofile/edit_profile_page.dart';
import 'package:bank_sha/ui/pin/pin_page.dart';
import 'package:bank_sha/ui/profilepin/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({super.key});

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
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img_profile.png',
                      ),
                    ),
                  ),
                  child: Align(
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
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                ProfileMenuItem(
                  image: 'assets/ic_edit_profile.png',
                  title: 'Edit Profile',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, PinPage.routeName) ==
                        true) {
                      Navigator.pushNamed(context, EditProfilePage.routeName);
                    }
                  },
                ),
                ProfileMenuItem(
                  image: 'assets/ic_pin.png',
                  title: 'My PIN',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, PinPage.routeName) ==
                        true) {
                      Navigator.pushNamed(
                          context, ProfileEditPinPage.routeName);
                    }
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
                ProfileMenuItem(
                  image: 'assets/ic_logout.png',
                  title: 'Log Out',
                  onPressed: () {},
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
