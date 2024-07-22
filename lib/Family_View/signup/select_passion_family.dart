
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/ToggleButtonSelectPassion.dart';

class SelectPassionFamilyView extends StatefulWidget {
  const SelectPassionFamilyView({super.key,});


  @override
  State<SelectPassionFamilyView> createState() => _SelectPassionFamilyViewState();
}

class _SelectPassionFamilyViewState extends State<SelectPassionFamilyView> {
  bool isSelected = false;

  void _handleTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: PreferredSize(

        preferredSize: const Size.square(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(icon: const Icon(Icons.west,color: AppColor.whiteColor,),onPressed: (){ Navigator.pop(context);},),
          title:  Text('Welcome',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
          ),
        ),
        child:  Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const VerticalSpeacing(26),
            Text('register as a Family',
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
            ),
            const  VerticalSpeacing(10),
            const  Column(
              children: [
                ToggleRadioButton(label: 'Animal care'),
                VerticalSpeacing(16.0),
                ToggleRadioButton(label: 'home sitter'),
                VerticalSpeacing(16.0),
                ToggleRadioButton(label: 'eiderly care'),
                VerticalSpeacing(16.0),
                ToggleRadioButton(label: 'homework'),
                VerticalSpeacing(16.0),
                ToggleRadioButton(label: 'cleanining'),
                VerticalSpeacing(16.0),
                ToggleRadioButton(label: 'music lesson'),
                VerticalSpeacing(16.0),
              ],
            ),
            const VerticalSpeacing(30.0),
            RoundedButton(title:'Register' ,onpress: (){
              Navigator.pushNamed(context, RoutesName.uploadIdFamily);
            },),


          ],),),
      ),
    );
  }
}
