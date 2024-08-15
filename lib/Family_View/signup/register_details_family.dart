import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/FamilyController/family_auth_controller.dart';
import 'package:nanny_fairy/ViewModel/auth_view_model.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/widgets/rounded_check_box.dart';
import '../../utils/utils.dart';

class RegisterDetailsFamily extends StatefulWidget {
  const RegisterDetailsFamily({super.key});

  @override
  State<RegisterDetailsFamily> createState() => _RegisterDetailsFamilyState();
}

class _RegisterDetailsFamilyState extends State<RegisterDetailsFamily> {
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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    houseNumberController.dispose();
    postCodeController.dispose();
    phoneController.dispose();
    dobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModelFamily = Provider.of<FamilyAuthController>(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.square(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.west,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Welcome to  new user',
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
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpeacing(30.0),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCustom(
                          controller: firstNameController,

                            prefixIcon: Icon(Icons.person_outline),
                            maxLines: 1,
                            hintText: 'Enter Name')),
                    SizedBox(width: 12),
                    Expanded(
                        child: TextFieldCustom(
                            controller: lastNameController,
                            prefixIcon: Icon(Icons.person_outline),
                            maxLines: 1,
                            hintText: 'Enter last')),
                  ],
                ),
                const VerticalSpeacing(10),
                 TextFieldCustom(
                     controller: addressController,
                    prefixIcon: Icon(Icons.location_on_outlined),
                    maxLines: 1,
                    hintText: 'Enter Address'),
                const VerticalSpeacing(10),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCustom(
                          controller: houseNumberController,
                            prefixIcon: Icon(Icons.home_outlined),
                            maxLines: 1,
                            hintText: 'House Number')),
                    SizedBox(width: 12),
                    Expanded(
                        child: TextFieldCustom(
                          controller: postCodeController,
                            prefixIcon: Icon(Icons.lock_outline),
                            maxLines: 1,
                            hintText: 'Post Code')),
                  ],
                ),
                const VerticalSpeacing(10),
                 TextFieldCustom(
                   controller: phoneController,
                    prefixIcon: Icon(Icons.phone),
                    maxLines: 1,
                    hintText: 'Enter telephone number'),
                const VerticalSpeacing(10),
                 TextFieldCustom(
                   controller: dobController,
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    maxLines: 1,
                    hintText: 'Date of birth'),
                const VerticalSpeacing(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedCheckbox(
                      value: isChecked,
                      onChanged: _handleCheckboxChanged,
                      activeColor: AppColor
                          .primaryColor, // Change this to your desired color
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
                          color: Colors
                              .black, // Use AppColor.blackColor if defined
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(24.0),
                RoundedButton(
                    title: 'Register',
                    onpress: () {
                      if (isChecked && isChecked2) {
                        authViewModelFamily.saveDetails(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            address: addressController.text,
                            houseNumber: houseNumberController.text,
                            postCode: postCodeController.text,
                            phoneNumber: phoneController.text,
                            dob: dobController.text,
                            context: context);
                      } else {
                        Utils.flushBarErrorMessage(
                            "Please select terms and Privacy Policy", context);
                      }
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
