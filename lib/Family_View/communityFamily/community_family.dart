import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/communityFamily/widgets/community_card_family.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/community/widgets/community_widget.dart';
import '../../res/components/colors.dart';

class CommunityViewFamily extends StatefulWidget {
  const CommunityViewFamily({super.key});

  @override
  State<CommunityViewFamily> createState() => _CommunityViewFamilyState();
}

class _CommunityViewFamilyState extends State<CommunityViewFamily> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.secondaryBgColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            'Community',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.uploadCommunityPost);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  height: 31,
                  width: 97,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Upload Post',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: AppColor.avatarColor,
            labelColor: AppColor.avatarColor,
            unselectedLabelColor: AppColor.whiteColor,
            tabs: [
              Tab(text: 'Topics'),
              Tab(text: 'My Posts'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            //Topics View
            Padding(
              padding: EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpeacing(16.0),
                    CommunituCartWidgetFamily(),
                    VerticalSpeacing(16.0),
                    CommunituCartWidgetFamily(),
                    VerticalSpeacing(16.0),
                    CommunituCartWidgetFamily(),
                  ],
                ),
              ),
            ),

            //Blog View
            Padding(
              padding: EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpeacing(16.0),
                    CommunituCartWidgetFamily(),
                    VerticalSpeacing(16.0),
                    CommunituCartWidgetFamily(),
                    VerticalSpeacing(16.0),
                    CommunituCartWidgetFamily(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
