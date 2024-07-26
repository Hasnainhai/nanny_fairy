import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/day_button.dart';

class AvailabilityView extends StatefulWidget {
  const AvailabilityView({super.key});

  @override
  State<AvailabilityView> createState() => _AvailabilityViewState();
}

class _AvailabilityViewState extends State<AvailabilityView> {
  String selectedDay = 'Monday';
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
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
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                        color: const Color(0xff1B81BC).withOpacity(
                            0.1), // Drop shadow color with 4% opacity
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
                        const SizedBox(
                            height: 16), // Added spacing from the top
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DayButton(
                              day: 'M',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
                            DayButton(
                              day: 'T',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
                            DayButton(
                              day: 'W',
                              isSelected: true,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
                            DayButton(
                              day: 'T',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
                            DayButton(
                              day: 'F',
                              isSelected: true,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
                            DayButton(
                              day: 'S',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
                            DayButton(
                              day: 'S',
                              isSelected: false,
                              onTap: (bool isSelected) {},
                            ),
                            const SizedBox(width: 8),
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
                        const AvailabilityRow(
                            label: 'Afternoon',
                            availability: [
                              false,
                              false,
                              false,
                              false,
                              false,
                              true,
                              false
                            ]),
                        const VerticalSpeacing(10),
                      ],
                    ),
                  ),
                ),
                const VerticalSpeacing(20.0),
                Container(
                  height: 216,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(12.0),
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
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Time',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedDay,
                                icon: const Icon(
                                  Icons.expand_more_outlined,
                                  color: Colors.blue,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDay = newValue!;
                                  });
                                },
                                items: days.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: GoogleFonts.getFont(
                                        "Poppins",
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpeacing(10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Morning',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                Text(
                                  'From',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const TimingContainer(time: '9:00Am'),
                                const SizedBox(width: 5),
                                Text(
                                  'To',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const TimingContainer(
                                  time: '12:00Am',
                                )
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        const VerticalSpeacing(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Evening',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                Text(
                                  'From',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const TimingContainer(time: '2:00Am'),
                                const SizedBox(width: 5),
                                Text(
                                  'To',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const TimingContainer(
                                  time: '6:00Am',
                                )
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        const VerticalSpeacing(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AfterNoon',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                Text(
                                  'From',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const TimingContainer(time: '7:00Am'),
                                const SizedBox(width: 5),
                                Text(
                                  'To',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const TimingContainer(
                                  time: '12:00Am',
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalSpeacing(46.0),
                RoundedButton(
                    title: 'Register',
                    onpress: () {
                      Navigator.pushNamed(
                          context, RoutesName.educationHorlyView);
                    }),
                const VerticalSpeacing(40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimingContainer extends StatefulWidget {
  const TimingContainer({super.key, required this.time});
  final String time;

  @override
  _TimingContainerState createState() => _TimingContainerState();
}

class _TimingContainerState extends State<TimingContainer> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 20,
        width: 67,
        decoration: BoxDecoration(
          color: _isSelected ? AppColor.primaryColor : Colors.white,
          border: Border.all(width: 0.5, color: AppColor.blackColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.time,
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: _isSelected ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
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
        color: isAvailable ? AppColor.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColor.blackColor, width: 0.5),
      ),
      height: 23,
      width: 22,
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
