import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';

class BookingCartWidgetFamily extends StatefulWidget {
  const BookingCartWidgetFamily(
      {super.key,
      required this.primaryButtonTxt,
      required this.ontapView,
      required this.primaryButtonColor,
      required this.profile,
      required this.name,
      required this.totalRatings,
      required this.ratings,
      required this.education,
      required this.horlyRate});
  final Function() ontapView;
  final String primaryButtonTxt;
  final Color primaryButtonColor;
  final String profile;
  final String name;
  final String totalRatings;
  final String ratings;
  final String education;
  final String horlyRate;

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 79,
                  width: 79,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                      image: AssetImage('images/post.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                    Text(
                      '⭐${widget.ratings}(${widget.totalRatings} Reviews)',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                    const VerticalSpeacing(10),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Icon(
                              Icons.school_outlined,
                              color: AppColor.blackColor,
                              size: 16,
                            ),
                            Text(
                              widget.education,
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
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            const Icon(
                              Icons.plus_one_outlined,
                              color: AppColor.blackColor,
                              size: 16,
                            ),
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
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.horlyRate,
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.euro_outlined,
                                  color: AppColor.blackColor,
                                  size: 16,
                                ),
                              ],
                            ),
                            Text(
                              'Horse Rate',
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
                  ],
                ),
                InkWell(
                  onTap: () {
                    widget.ontapView();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColor.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Center(
                        child: Text(
                          widget.primaryButtonTxt,
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: _isSelected ? Colors.blue : Colors.transparent,
          border: Border.all(color: _isSelected ? Colors.blue : Colors.grey),
        ),
        // padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
        child: Center(
          child: Text(
            widget.day,
            style: TextStyle(
              fontSize: 8,
              color: _isSelected ? Colors.white : AppColor.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
