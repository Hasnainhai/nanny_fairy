
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/widgets/rounded_check_box.dart';

class RegisterDetails extends StatefulWidget {
  const RegisterDetails({super.key});

  @override
  State<RegisterDetails> createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  bool isChecked = false;
  bool isChecked2 = false;

  void _handleCheckboxChanged(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }
  void _handleCheckboxChanged2(bool? value) {
    setState(() {
      isChecked2 = value ?? false;
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
          title:  Text('Welcome to  new user',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
          ),
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
        child:  Padding(padding: const EdgeInsets.only(left: 16.0,right: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpeacing(30.0),
              const TextFieldCustom(maxLines: 1, text: 'Name',hintText: 'Raees Khan'),
              const VerticalSpeacing(16),
              const TextFieldCustom(maxLines: 1, text: 'Address',hintText: 'E-11 Islamad'),
              const VerticalSpeacing(16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: TextFieldCustom(maxLines: 1, text: 'house number',hintText: '1122334')),
                SizedBox(width: 12),
                  Expanded(child: TextFieldCustom(maxLines: 1, text: 'post code',hintText: '123456')),
                ],
              ),
              const VerticalSpeacing(16),
              const TextFieldCustom(maxLines: 1, text: 'Telephone number',hintText: '+923129739152'),
              const VerticalSpeacing(16),
              const TextFieldCustom(maxLines: 1, text: 'Date of birth',hintText: '26/4/2024'),
              const VerticalSpeacing(16),
              const TextFieldCustom(maxLines: 1, text: 'Email address',hintText: 'Hasnain@gmail.com'),
              const VerticalSpeacing(16),
              const TextFieldCustom(maxLines: 1, text: 'password',hintText: '11cd1'),
              const VerticalSpeacing(16),
              const TextFieldCustom(maxLines: 1, text: 'hours rate',hintText: '\$50'),
              const VerticalSpeacing(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedCheckbox(
                value: isChecked,
                onChanged: _handleCheckboxChanged,
                activeColor: AppColor.primaryColor, // Change this to your desired color
              ),
              const SizedBox(width: 8),
              Text(
                'I agree with the terms and condition',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
              const VerticalSpeacing(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundedCheckbox(
                    value: isChecked2,
                    onChanged: _handleCheckboxChanged2,
                    activeColor: AppColor.primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'I agree with free privacy policy',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black, // Use AppColor.blackColor if defined
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(24.0),
              RoundedButton(title: 'Register', onpress: (){
                Navigator.pushNamed(context, RoutesName.uploadImg);
              }),
              const VerticalSpeacing(30.0),
            ],
          ),
        ),
        ),
    ),

    );
  }
}

