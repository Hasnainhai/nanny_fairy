import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';

class SelectPreference extends StatefulWidget {
  const SelectPreference({super.key});

  @override
  State<SelectPreference> createState() => _SelectPreferenceState();
}

class _SelectPreferenceState extends State<SelectPreference> {
  String _btn2SelectedVal = "Animal care";
  static const menuItems = <String>[
    'Animal care',
    'home sitter',
    'eiderly care',
    'homework',
    'cleanining',
    'music lesson',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: AppColor.blackColor),
          ),
        ),
      )
      .toList();
  String dropvalve = "Animal care";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.west,
            color: AppColor.blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Reference',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const VerticalSpeacing(30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextFieldCustom(
                    prefixIcon: Icon(Icons.school_outlined),
                    maxLines: 1,
                    hintText: 'Enter your experience',
                  ),
                  const VerticalSpeacing(16.0),
                  Text(
                    'Referance',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text(
                    'Name',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  const TextFieldCustom(
                    maxLines: 1,
                    hintText: 'Job',
                  ),
                  Text(
                    'Which Skill You are provided',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      border: Border.all(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xff1B81BC)
                            .withOpacity(0.10), // Stroke color with 10% opacity
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff1B81BC).withOpacity(
                              0.1), // Drop shadow color with 4% opacity
                          blurRadius: 2,
                          offset: const Offset(1, 2),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8.0),
                      child: DropdownButton(
                        dropdownColor: AppColor.whiteColor,
                        isExpanded: true,
                        icon: const Icon(Icons.expand_more),
                        underline: const SizedBox(),
                        value: _btn2SelectedVal,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _btn2SelectedVal = newValue;
                            });
                          }
                        },
                        items: _dropDownMenuItems,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextFieldCustom(
                        maxLines: 1,
                        hintText: 'Land',
                      )),
                      SizedBox(width: 10.0),
                      Expanded(
                          child: TextFieldCustom(
                        maxLines: 1,
                        hintText: 'Mobile Number',
                      )),
                    ],
                  ),
                  const VerticalSpeacing(60.0),
                  RoundedButton(
                      title: 'Continue',
                      onpress: () {
                        Navigator.pushNamed(context, RoutesName.uploadId);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
