

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/components/colors.dart';

class JobCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListTile(
          leading: const Icon(
            Icons.account_balance_wallet_outlined,
            color: AppColor.blackColor,
          ),
          title: Text(
            'verieer jo profile via IDin',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor,
              ),
            ),
          ),
          subtitle: Text(
            'Officia irure irure anim nisir\nvelit cupidatat qui Lorem id.',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.grayColor,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.grayColor,
            ),
          ),
        ),
      ),
    );
  }
}