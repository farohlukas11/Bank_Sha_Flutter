import 'package:flutter/material.dart';

import '../../common/theme.dart';

class TopUpBankItem extends StatelessWidget {
  final String image;
  final String name;

  final String time;
  final VoidCallback? onTap;
  final bool isSelected;

  const TopUpBankItem({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
    this.isSelected = false,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        height: 87,
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? blueColor : whiteColor,
            width: 2,
          ),
          color: whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 30,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                  time,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
