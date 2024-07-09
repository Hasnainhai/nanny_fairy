

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
    appBar:   AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.west,color: AppColor.blackColor,),onPressed: (){ Navigator.pop(context);},),
        title:  Text('Upload Profile',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ),
      centerTitle: true,
      ),
body: Padding(padding: const EdgeInsets.only(left: 16.0,right: 16.0),child: SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    const VerticalSpeacing(30.0),
    Container(
      height: 382,
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(padding: const EdgeInsets.all(20.0),child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Aliqua officia duis occaecat consectetur fugiat nostrud anim dolor commodo',
            textAlign: TextAlign.center,

            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColor.blackColor,
              ),
            ),
          ),
          Container(
            height:120,
            width: 111.46,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('images/profile.png'),fit: BoxFit.contain),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: AppColor.primaryColor

                ),
                child: Center(child: IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt_outlined,color: AppColor.whiteColor,),),
              ),),
              const SizedBox(width: 16.0),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: AppColor.primaryColor

                ),
                child: Center(child: IconButton(onPressed: (){}, icon: const Icon(Icons.save_as_outlined,color: AppColor.whiteColor,),),
                ),),
            ],
          ),

        ],
      ),),

    ),
    const VerticalSpeacing(30.0),
    Text('Awrite introduction to your self',
      textAlign: TextAlign.center,

      style: GoogleFonts.getFont(
        "Poppins",
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor,
        ),
      ),
    ),
  const VerticalSpeacing(10.0),
      Container(height: 200,
      width: double.infinity,
      color: AppColor.boxFillColor,
        child: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: TextField(decoration: InputDecoration(hintText: 'Type...', border: InputBorder.none,),
          ),
        ),
      ),
      const VerticalSpeacing(8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('100 Words',
            textAlign: TextAlign.center,

            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.blackColor,
              ),
            ),
          ),
        ],
      ),
      const VerticalSpeacing(46.0),
      RoundedButton(title: 'Continue', onpress: (){
        Navigator.pushNamed(context, RoutesName.uploadId);
      }),
      const VerticalSpeacing(30.0),

  ],),
),),

    );
  }
}
