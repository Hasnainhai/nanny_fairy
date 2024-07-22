import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/day_button.dart';
import '../../../res/components/widgets/card_button.dart';

class BookingCartWidgetFamily extends StatefulWidget {
  const BookingCartWidgetFamily(
      {super.key, required this.primaryButtonTxt, required this.ontapView});
  final Function() ontapView;
  final String primaryButtonTxt;

  @override
  State<BookingCartWidgetFamily> createState() =>
      _BookingCartWidgetFamilyState();
}

class _BookingCartWidgetFamilyState extends State<BookingCartWidgetFamily> {
  // popUp
  void showSubscribtionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/popImg.png',
                width: 150,
                height: 150,
              ),
              const VerticalSpeacing(16),
              Text(
                'Agree to Subscription of\n€2/month',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const VerticalSpeacing(30),
              RoundedButton(
                title: 'Subscribe and Chat',
                onpress: () {
                  Navigator.pushNamed(context, RoutesName.paymentView);
                },
              ),
              const VerticalSpeacing(16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 131,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
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
        child: Column(
          children: [
            ListTile(
              leading: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.shutterstock.com/image-photo/family-selfie-portrait-grandparents-children-260nw-2352440117.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: Text(
                'Hassnain\n⭐4.8(45 Reviews)',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              subtitle: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.school_outlined,color: AppColor.blackColor),
                      Text(
                        'MBBS',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Icon(Icons.plus_one_outlined,color: AppColor.blackColor),
                      Text(
                        'Skill',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '23',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          Icon(Icons.euro_outlined,color: AppColor.blackColor,size: 16,),
                        ],
                      ),



                      Text(
                        'Hourse Rate',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              trailing: CardButton(
                title: widget.primaryButtonTxt,
                color: AppColor.primaryColor,
                onTap: () {
                  widget.ontapView();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  'Online: Today',
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    DayButtonFamily(
                      day: 'M',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),
                    SizedBox(width: 4),
                    DayButtonFamily(
                      day: 'T',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),
                    SizedBox(width: 4),
                    DayButtonFamily(
                      day: 'W',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),
                    SizedBox(width: 4),
                    DayButtonFamily(
                      day: 'T',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),
                    SizedBox(width: 4),
                    DayButtonFamily(
                      day: 'F',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),
                    SizedBox(width: 4),
                    DayButtonFamily(
                      day: 'S',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),
                    SizedBox(width: 4),
                    DayButtonFamily(
                      day: 'S',
                      isSelected: false,
                      onTap: (bool isSelected) {},
                    ),


                  ],
                ),


              ],
            ),
            const VerticalSpeacing(10.0),
          ],
        ),
      ),
    );
  }
}



class DayButtonFamily extends StatefulWidget {
  final String day;
  final bool isSelected;
  final Function(bool) onTap;

  const DayButtonFamily({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _DayButtonFamilyState createState() => _DayButtonFamilyState();
}

class _DayButtonFamilyState extends State<DayButtonFamily> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _handleTap() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onTap(_isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue : Colors.transparent,

          border: Border.all(color: _isSelected ? Colors.blue : Colors.grey),
        ),
        padding: const EdgeInsets.only(left: 4,right: 4,top: 2,bottom: 2),
        child: Text(
          widget.day,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


