import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/familyChat/family_chat_list.dart';
import 'package:nanny_fairy/Family_View/familyChat/family_chat_view.dart';
import 'package:nanny_fairy/Family_View/familyChat/widgets/family_chat_screen_widget.dart';
import 'package:nanny_fairy/Family_View/payment_family/payment_family.dart';
import 'package:nanny_fairy/Repository/get_family_info_repo.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../res/components/colors.dart';

class ProviderDetails extends StatefulWidget {
  const ProviderDetails(
      {super.key,
      required this.profile,
      required this.name,
      required this.bio,
      required this.horseRate,
      required this.experience,
      required this.degree,
      required this.dayButtons,
      required this.timeData,
      required this.familyId});
  final String profile;
  final String name;
  final String bio;
  final String horseRate;
  final String experience;
  final String degree;
  final List<Widget> dayButtons;
  final Map<String, String> timeData;
  final String familyId;

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  GetFamilyInfoRepo getFamilyInfoRepo = GetFamilyInfoRepo();
  @override
  void initState() {
    getFamilyInfoRepo.fetchCurrentFamilyInfo();
    super.initState();
  }

  // popUp
  void showSubscribtionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.zero,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentFamilyView(
                                  userName: widget.name,
                                  currentUserName:
                                      getFamilyInfoRepo.familyName.toString(),
                                  familyId: widget.familyId,
                                  currentUserProfile: getFamilyInfoRepo
                                      .familyProfile
                                      .toString(),
                                  profile: widget.profile)));
                      // print(
                      //     'profile:${widget.profile}: userName:${widget.name}:familyId: ${widget.familyId}: currentUserName:${getFamilyInfoRepo.familyName!}:Family profile${getFamilyInfoRepo.familyProfile} ');

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

  bool _isExpanded = false;

  void _toggleViewMore() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
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
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
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
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          widget.name,
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackColor),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              '4.8 (456 Reviews)',
                              style: GoogleFonts.getFont(
                                "Poppins",
                                textStyle: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.bio,
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grayColor,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Officia irure ir',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.blackColor),
                                    ),
                                  ),
                                  Text(
                                    'Officia irure irOfficia',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.blackColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Language spoken',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.blackColor),
                                    ),
                                  ),
                                  Text(
                                    'English, urdu',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.blackColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Officia irure ir',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.blackColor),
                                    ),
                                  ),
                                  Text(
                                    'Officia irure irOfficia',
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.blackColor),
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
                                    color: AppColor.blackColor),
                              ),
                            ),
                            const VerticalSpeacing(10),
                            Row(
                              children: [
                                SkillContainerWidget(
                                    title: '${widget.horseRate}€',
                                    subTitle: 'Hours'),
                                const SizedBox(width: 16),
                                SkillContainerWidget(
                                    title: widget.experience,
                                    subTitle: 'Experience'),
                                const SizedBox(width: 16),
                                Container(
                                  height: 39,
                                  width: 43,
                                  decoration: BoxDecoration(
                                      color: AppColor.avatarColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.school_outlined,
                                          color: AppColor.whiteColor),
                                      Text(
                                        widget.degree,
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Lorem ipsum dolor sit amet c',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColor.grayColor,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: widget
                                      .dayButtons, // Use the day buttons here
                                ),
                              ],
                            ),
                            const VerticalSpeacing(10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: _toggleViewMore,
                                      child: Text(
                                        'View More',
                                        style: GoogleFonts.getFont(
                                          "Poppins",
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            if (_isExpanded)
                              Container(
                                height: 216,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 16),
                                      const VerticalSpeacing(16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Morning',
                                            style: GoogleFonts.getFont(
                                              "Poppins",
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.blackColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${widget.timeData['MorningStart']} to ${widget.timeData['MorningEnd']}',
                                            style: GoogleFonts.getFont(
                                              "Poppins",
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const VerticalSpeacing(16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Afternoon',
                                            style: GoogleFonts.getFont(
                                              "Poppins",
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.blackColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${widget.timeData['AfternoonStart']} to ${widget.timeData['AfternoonEnd']}',
                                            style: GoogleFonts.getFont(
                                              "Poppins",
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const VerticalSpeacing(16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Evening',
                                            style: GoogleFonts.getFont(
                                              "Poppins",
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.blackColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${widget.timeData['EveningStart']} to ${widget.timeData['EveningEnd']}',
                                            style: GoogleFonts.getFont(
                                              "Poppins",
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const Divider(),
                            const VerticalSpeacing(16),
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
                                            color: Colors.grey.withOpacity(0.1),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Aliqua officia duis\noccaecat\nfnostrud',
                                                  style: GoogleFonts.getFont(
                                                    "Poppins",
                                                    textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                            color: Colors.grey.withOpacity(0.1),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Aliqua officia duis\noccaecat\nfnostrud',
                                                  style: GoogleFonts.getFont(
                                                    "Poppins",
                                                    textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
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
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                widget.profile,
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
