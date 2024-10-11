import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/widgets/vertical_spacing.dart';

class HomeFeatureContainerFamily extends StatelessWidget {
  const HomeFeatureContainerFamily(
      {super.key,
        required this.img,
        required this.title,
     required this.bgColor, required this.txColor});
  final String img;
  final String title;
  final Color bgColor;
  final Color txColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: bgColor,
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: const Color(0xff1B81BC)
              .withOpacity(0.10), // Stroke color with 10% opacity
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1B81BC)
                .withOpacity(0.1), // Drop shadow color with 4% opacity
            blurRadius: 2,
            offset: const Offset(1, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 44,
              width: 47,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                ),
              ),
            ),
            const VerticalSpeacing(10),
            Text(
              title,
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
