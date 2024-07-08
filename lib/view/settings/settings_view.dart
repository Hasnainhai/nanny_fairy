import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/toggle_widget.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../res/components/colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryBgColor,
        title: Text(
          'Settings',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.west,
              color: AppColor.blackColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 320,
                width: double.infinity,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpeacing(10.0),
                      Text(
                        'bepaal je eigen. uurtarief',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(10.0),
                      Text(
                        'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Officia irure irure   ',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColor.grayColor,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 165,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: AppColor.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                'Meet Information',
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const VerticalSpeacing(10.0),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(Icons.light_mode_outlined,
                                color: AppColor.blackColor),
                            const SizedBox(width: 5.0),
                            Text(
                              'Dag',
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
                        subtitle: Text(
                          'Officia irure irure anim n  ',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grayColor,
                            ),
                          ),
                        ),
                        trailing: SizedBox(
                          width: 85,
                          height: 30,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 9,
                                backgroundColor: AppColor.boxFillColor,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '\$ 7,00',
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const CircleAvatar(
                                radius: 9,
                                backgroundColor: AppColor.boxFillColor,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Icon(
                                    Icons.maximize,
                                    size: 14,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(Icons.dark_mode_outlined,
                                color: AppColor.blackColor),
                            const SizedBox(width: 5.0),
                            Text(
                              'Nacht',
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
                        subtitle: Text(
                          'Officia irure irure anim n  ',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grayColor,
                            ),
                          ),
                        ),
                        trailing: SizedBox(
                          width: 85,
                          height: 30,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 9,
                                backgroundColor: AppColor.boxFillColor,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '\$ 7,00',
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const CircleAvatar(
                                radius: 9,
                                backgroundColor: AppColor.boxFillColor,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Icon(
                                    Icons.maximize,
                                    size: 14,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpeacing(16.0),
              Text(
                'Notification',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              Container(
                height: 146,
                width: double.infinity,
                color: AppColor.whiteColor,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
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
                      const ToggleWidget(title: 'promotioneel'),
                      const VerticalSpeacing(16.0),
                      const ToggleWidget(title: 'Status updates over bookigen'),
                    ],
                  ),
                ),
              ),
              const VerticalSpeacing(16.0),
              Text(
                'Account',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const VerticalSpeacing(10.0),
              Container(
                height: 185,
                width: double.infinity,
                color: AppColor.whiteColor,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account',
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
                            'Deactivr of verwijderen',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpeacing(16.0),
                      Text(
                        'email address',
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
                        'hasnain@gmail.com',
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
                        'watchwood',
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
                        '***********',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
