import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';

import '../../../res/components/colors.dart';

class AvailabilityView extends StatelessWidget {
  const AvailabilityView({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Availability',
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
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),

        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(12),
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

                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16), // Added spacing from the top
                        Text(
                          'Availability',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Officia irure irure an',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.grayColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DayButton(
                              day: 'M',
                              isSelected: true,
                              onTap: (bool isSelected) {},
                            ),
                            DayButton(
                              day: 'T',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            DayButton(
                              day: 'W',
                              isSelected: true,
                              onTap: (bool isSelected) {},
                            ),
                            DayButton(
                              day: 'T',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            DayButton(
                              day: 'F',
                              isSelected: true,
                              onTap: (bool isSelected) {},
                            ),
                            DayButton(
                              day: 'S',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const AvailabilityRow(label: 'Morning', availability: [
                          true,
                          true,
                          false,
                          false,
                          false,
                          false,
                          false
                        ]),
                        const Divider(),
                        const AvailabilityRow(label: 'Evening', availability: [
                          false,
                          false,
                          false,
                          true,
                          false,
                          false,
                          false
                        ]),
                        const Divider(),
                        const AvailabilityRow(label: 'Afternoon', availability: [
                          false,
                          false,
                          false,
                          false,
                          false,
                          true,
                          false
                        ]),




                        const SizedBox(height: 16),

                      ],
                    ),
                  ),
                ),
                VerticalSpeacing(30.0),
                Container(
                  height: 216,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
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
                ),
                const VerticalSpeacing(46.0),
                RoundedButton(title: 'Register', onpress: () {
                  Navigator.pushNamed(context, RoutesName.educationHorlyView);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DayButton extends StatefulWidget {
  final String day;
  final bool isSelected;
  final Function(bool) onTap;

  const DayButton({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
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
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _isSelected ? Colors.blue : Colors.grey),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          widget.day,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class AvailabilityRow extends StatefulWidget {
  final String label;
  final List<bool> availability;

  const AvailabilityRow({
    required this.label,
    required this.availability,
  });

  @override
  _AvailabilityRowState createState() => _AvailabilityRowState();
}

class _AvailabilityRowState extends State<AvailabilityRow> {
  late List<bool> _availability;

  @override
  void initState() {
    super.initState();
    _availability =
        List.from(widget.availability); // Initialize with widget's availability
  }

  void _toggleAvailability(int index) {
    setState(() {
      _availability[index] = !_availability[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Row(
            children: _availability
                .asMap()
                .entries
                .map((entry) => GestureDetector(
                      onTap: () => _toggleAvailability(entry.key),
                      child: AvailabilityCheckBox(isAvailable: entry.value),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class AvailabilityCheckBox extends StatelessWidget {
  final bool isAvailable;

  const AvailabilityCheckBox({
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isAvailable ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      width: 24,
      height: 24,
      child: isAvailable
          ? const Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
            )
          : null,
    );
  }
}
