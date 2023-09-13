import 'package:bank_sha/ui/editprofile/profile_edit_success_page.dart';
import 'package:flutter/material.dart';

import '../../common/shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfileEditPinPage extends StatelessWidget {
  static const routeName = '/edit-profile-pin';

  const ProfileEditPinPage({super.key});

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
          'Edit PIN',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                //Old PIN INPUT
                const CustomFormField(
                  title: 'Old PIN',
                ),
                const SizedBox(
                  height: 16,
                ),

                //FUllNAME New PIN
                const CustomFormField(
                  title: 'New PIN',
                ),

                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        ProfileEditSuccessPage.routeName, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
