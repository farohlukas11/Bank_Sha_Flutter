import 'package:flutter/material.dart';

import '../../common/theme.dart';

class RecentUserItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;

  final VoidCallback? onTap;

  final bool onSelected;

  const RecentUserItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.username,
    this.isVerified = false,
    required this.onTap,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        height: 89,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
                border: Border.all(
                  color: onSelected ? blueColor : whiteColor,
                  width: 1,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '@$username',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              child: isVerified
                  ? Row(
                      children: [
                        Image.asset(
                          'assets/ic_check.png',
                          width: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Verified',
                          style: greenTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
