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
      child: Text(value,style: const TextStyle(color: AppColor.blackColor),),
    ),
  )
      .toList();
  String _btnSelectedVal1 = "Family";
  static const menuItems1 = <String>[
    'Family',
    'Friends',
    'Relative',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems1 = menuItems1
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value,style: const TextStyle(color: AppColor.whiteColor),),
    ),
  )
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.west,color: AppColor.blackColor,),onPressed: (){
          Navigator.pop(context);
        },),
        title:  Text('Preference',
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
      body: Padding(padding: const EdgeInsets.only(left: 16.0,right: 16.0),child: Column(
        children: [
          const VerticalSpeacing(30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Experience',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
        const VerticalSpeacing(10),
        Container(
          color: AppColor.boxFillColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8.0),
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
              const VerticalSpeacing(16.0),
              Text('Referance',
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
              const TextFieldCustom(maxLines: 1, text: 'Name',hintText: 'Animal care',),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: TextFieldCustom(maxLines: 1, text: 'Land',hintText: 'Pk',)),
                  SizedBox(width: 10.0),
                  Expanded(child: TextFieldCustom(maxLines: 1, text: 'Mobile Number',hintText: '+923129739152',)),

                ],
              ),
              const VerticalSpeacing(30.0),
              Row(
                children: [
                  Expanded(child:   Text('Enter family you care',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),),
                  Expanded(child: Container(height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.primaryColor
                  ),
                    child: Padding(padding: const EdgeInsets.all(15.0),child: DropdownButton(
                      dropdownColor: AppColor.primaryColor,
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: _btnSelectedVal1,
                      icon: const Icon(Icons.expand_more),
                      iconEnabledColor: Colors.white, // Change this to your desired color
                      iconDisabledColor: Colors.white,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _btnSelectedVal1 = newValue;

                          });
                        }
                      },
                      items: _dropDownMenuItems1,
                    ),),

                  ),

                  ),
                ],
              ),

            ],
          ),
          const VerticalSpeacing(60.0),
          RoundedButton(title: 'Continue', onpress: (){
            Navigator.pushNamed(context, RoutesName.fillpreferenceView);
          }),
        ],
      ),
      ),
    );
  }
}
