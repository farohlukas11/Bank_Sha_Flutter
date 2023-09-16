import 'package:bank_sha/common/shared_method.dart';
import 'package:flutter/material.dart';

import '../../common/theme.dart';

class PackageItem extends StatelessWidget {
  final String gigaByte;
  final num price;
  final VoidCallback? onTap;
  final bool isSelected;

  const PackageItem({
    super.key,
    required this.gigaByte,
    required this.price,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        width: 155,
        height: 171,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? blueColor : whiteColor,
            width: 2,
          ),
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${gigaByte}GB',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              formatCurrency(price),
              style: greyTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
