import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';
import '../../view/filter/widgets/slider_widget.dart';

class FilterPopUp extends StatefulWidget {
  const FilterPopUp({super.key});

  @override
  State<FilterPopUp> createState() => _FilterPopUpState();
}

class _FilterPopUpState extends State<FilterPopUp> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  bool button5 = true;
  bool button6 = false;
  bool button7 = false;
  bool button8 = true;
  bool button9 = false;
  bool button10 = false;
  bool button11 = true;
  bool button12 = false;
  bool button13 = false;
  bool button14 = true;
  bool button15 = false;
  bool button16 = false;
  bool button17 = false;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColor.secondaryBgColor,
      child: ListView(
        children: [
          Container(
            height: 116,
            width: double.infinity,
            color: AppColor.primaryColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    const Text(
                      "Filters",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                        button1 = false;
                        button2 = false;
                        button3 = false;
                        button4 = false;
                        button5 = false;
                        button6 = false;
                        button7 = false;
                        button8 = false;
                        button9 = false;
                        button10 = false;
                        button11 = false;
                        button12 = false;
                        button13 = false;
                        button14 = false;
                        button15 = false;
                        button16 = false;
                        button17 = false;
                      },
                      child: const Text(
                        "Reset",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpeacing(16),
                const Text(
                  " provider Categories",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(
                      label: "Cleaning",
                      isSelected: button1,
                      onTap: () {
                        setState(() {
                          button1 = !button1;
                        });
                      },
                    ),
                    FilterButton(
                      label: "Home",
                      isSelected: button2,
                      onTap: () {
                        setState(() {
                          button2 = !button2;
                        });
                      },
                    ),
                    FilterButton(
                      label: "Children Care",
                      isSelected: button3,
                      onTap: () {
                        setState(() {
                          button3 = !button3;
                        });
                      },
                    ),
                  ],
                ),
                const VerticalSpeacing(
                  20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(
                      label: "Music Lesson",
                      isSelected: button4,
                      onTap: () {
                        setState(() {
                          button4 = !button4;
                        });
                      },
                    ),
                    FilterButton(
                      label: "House Setting",
                      isSelected: button5,
                      onTap: () {
                        setState(() {
                          button5 = !button5;
                        });
                      },
                    ),
                    FilterButton(
                      label: "Elderly Care",
                      isSelected: button6,
                      onTap: () {
                        setState(() {
                          button6 = !button6;
                        });
                      },
                    ),
                  ],
                ),
                const VerticalSpeacing(14),
                FilterButton(
                  label: "Pet Care",
                  isSelected: button7,
                  onTap: () {
                    setState(() {
                      button7 = !button7;
                    });
                  },
                ),
                const VerticalSpeacing(16),
                const Text(
                  "Select Radius",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(
                      label: "2KM",
                      isSelected: button10,
                      onTap: () {
                        setState(() {
                          button10 = !button10;
                        });
                      },
                    ),
                    FilterButton(
                      label: "4KM",
                      isSelected: button8,
                      onTap: () {
                        setState(() {
                          button8 = !button8;
                        });
                      },
                    ),
                    FilterButton(
                      label: "8KM",
                      isSelected: button9,
                      onTap: () {
                        setState(() {
                          button9 = !button9;
                        });
                      },
                    ),
                  ],
                ),
                const VerticalSpeacing(
                  30,
                ),
                const Text(
                  "Rating Star",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(
                  14,
                ),
                RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    allowHalfRating: true,
                    glowColor: Colors.amber,
                    itemCount: 5,
                    itemSize: 30,
                    itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {}),
                const VerticalSpeacing(
                  50,
                ),
                RoundedButton(
                    title: 'Apply Filters',
                    onpress: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(color: AppColor.borderColor, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'CenturyGothic',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
