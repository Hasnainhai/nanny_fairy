import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/view/job/widgets/find_job.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class FindJobView extends StatelessWidget {
  const FindJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
     body: Column(
       children: [
         Stack(
           clipBehavior: Clip.none,
           children: [
             Container(
                 height: 150,
                 width: double.infinity,
                 decoration: const BoxDecoration(
                   color: AppColor.primaryColor,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(20),
                     bottomRight: Radius.circular(20),
                   ),
                 ),
                 child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'Family Profile Detail',
                           style: GoogleFonts.getFont(
                             "Poppins",
                             textStyle: const TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.w400,
                               color: AppColor.whiteColor,
                             ),
                           ),
                         ),
                       ],
                     ))),
             Positioned(
               top: 125, // Adjust this value as needed
               left: (MediaQuery.of(context).size.width - 320) /
                   2, // Center horizontally
               child: const SearchBar(),
             ),
           ],
         ),
       ],
     ),
    );
  }
}