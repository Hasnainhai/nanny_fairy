import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/bookFamily/widgets/book_cart_widget_family.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../res/components/colors.dart';
import '../../utils/routes/routes_name.dart';

class ProviderDetails extends StatefulWidget {
  const ProviderDetails({super.key});

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  // popUp
  void showSubscribtionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          contentPadding: EdgeInsets.zero, // Remove default padding
          content: Container(
            width: MediaQuery.of(context).size.width *
                0.8, // Set width to 80% of screen width
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  width:
                      double.infinity, // Fill the width of the parent container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: AppColor.primaryColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      'images/popImg.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: RoundedButton(
                    title: 'Subscribe and Chat',
                    onpress: () {
                      Navigator.pushNamed(context, RoutesName.paymentView);
                    },
                  ),
                ),
                const VerticalSpeacing(16),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
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
          'Provider Profile Detail',
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Container(
          //   height: 150,
          //   width: double.infinity,
          //   decoration: const BoxDecoration(
          //     color: AppColor.primaryColor,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(20),
          //       bottomRight: Radius.circular(20),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Rayees khan(34)',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              '4.8 (456 Reviews)',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Officia irure irure anim nisi exercitation velit cupidatat qui Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Officia irure irure anim nisi exercitation velit cupidatat qui Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad.',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Officia irure ir',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Officia irure irOfficia',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Language spoken',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'English, urdu',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Officia irure ir',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Officia irure irOfficia',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpeacing(16),
                        const Divider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skill & Experience',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const VerticalSpeacing(10),
                            Row(
                              children: [
                                const SkillContainerWidget(
                                    title: '12\$', subTitle: 'Hours'),
                                const SizedBox(width: 16),
                                const SkillContainerWidget(
                                    title: '20+', subTitle: 'Experience'),
                                const SizedBox(width: 16),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.avatarColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.school_outlined,
                                            color: AppColor.whiteColor),
                                        Text(
                                          'MBBS',
                                          style: GoogleFonts.getFont(
                                            "Poppins",
                                            textStyle: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Availability portion
                            Column(
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
                                  'Lorem ipsum dolor sit amet c',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.grayColor,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DayButtonFamily(
                                      day: 'M',
                                      isSelected: true,
                                      onTap: (bool isSelected) {},
                                    ),
                                    DayButtonFamily(
                                      day: 'T',
                                      isSelected: false,
                                      onTap: (bool isSelected) {},
                                    ),
                                    DayButtonFamily(
                                      day: 'W',
                                      isSelected: true,
                                      onTap: (bool isSelected) {},
                                    ),
                                    DayButtonFamily(
                                      day: 'T',
                                      isSelected: false,
                                      onTap: (bool isSelected) {},
                                    ),
                                    DayButtonFamily(
                                      day: 'F',
                                      isSelected: true,
                                      onTap: (bool isSelected) {},
                                    ),
                                    DayButtonFamily(
                                      day: 'S',
                                      isSelected: false,
                                      onTap: (bool isSelected) {},
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const AvailabilityRow(
                                    label: 'Morning',
                                    availability: [
                                      true,
                                      true,
                                      false,
                                      false,
                                      false,
                                      false,
                                      false
                                    ]),
                                const Divider(),
                                const AvailabilityRow(
                                    label: 'Evening',
                                    availability: [
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
                            //Family rating Portion
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Family Ratings',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  'More Review',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const VerticalSpeacing(16.0),
                            SizedBox(
                              height: 90,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 85,
                                      width: 221,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5, right: 5),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 16.0),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8')),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Aliza shah',
                                                  style: GoogleFonts.getFont(
                                                    "Poppins",
                                                    textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColor.blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Aliqua officia duis\noccaecat\nfnostrud',
                                                  style: GoogleFonts.getFont(
                                                    "Poppins",
                                                    textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColor.grayColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 20,
                                            ),
                                            Text(
                                              '4.5',
                                              style: GoogleFonts.getFont(
                                                "Poppins",
                                                textStyle: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.primaryColor,
                                                ),
                                              ),
                                            ),
                                            // Row(children: [
                                            //
                                            // ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 85,
                                      width: 221,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5, right: 5),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 16.0),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8')),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Aliza shah',
                                                  style: GoogleFonts.getFont(
                                                    "Poppins",
                                                    textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColor.blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Aliqua officia duis\noccaecat\nfnostrud',
                                                  style: GoogleFonts.getFont(
                                                    "Poppins",
                                                    textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColor.grayColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 20,
                                            ),
                                            Text(
                                              '4.5',
                                              style: GoogleFonts.getFont(
                                                "Poppins",
                                                textStyle: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.primaryColor,
                                                ),
                                              ),
                                            ),
                                            // Row(children: [
                                            //
                                            // ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpeacing(26),
                        RoundedButton(
                            title: 'Chat With Provider',
                            onpress: () {
                              showSubscribtionDialog(context);
                            }),
                        const VerticalSpeacing(40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://play-lh.googleusercontent.com/jInS55DYPnTZq8GpylyLmK2L2cDmUoahVacfN_Js_TsOkBEoizKmAl5-p8iFeLiNjtE=w526-h296-rw',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillContainerWidget extends StatelessWidget {
  const SkillContainerWidget(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.avatarColor, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              subTitle,
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
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
      padding: const EdgeInsets.all(5),
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
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: isAvailable ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey),
      ),
      width: 15,
      height: 15,
      child: isAvailable
          ? const Icon(
              Icons.check,
              size: 12,
              color: Colors.white,
            )
          : null,
    );
  }
}
