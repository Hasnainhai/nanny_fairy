import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/community/widgets/community_widget.dart';
import '../../res/components/colors.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.secondaryBgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            'Community',
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
          actions: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.uploadCommunityPost);

              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  height: 31,
                  width: 97,
                  color: AppColor.primaryColor,
                  child: Center(child: Text(
                    'Upload Post',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),),
                ),
              ),
            ),

          ],

          bottom: const TabBar(
            indicatorColor: AppColor.primaryColor,
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.blackColor,
            tabs: [
              Tab(text: 'Topics'),
              Tab(text: 'Tips & Tricks'),
              Tab(text: 'Blog'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Topics View
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommunituCartWidget(),
                    Text(
                      'Cleaning',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                    const VerticalSpeacing(5.0),
                    const CommunituCartWidget(),
                    Text(
                      'Family',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                    const VerticalSpeacing(5.0),
                    const CommunituCartWidget(),
                  ],
                ),
              ),
            ),
            //Tips & Tricks View
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommunituCartWidget(),
                    CommunituCartWidget(),
                    CommunituCartWidget(),
                  ],
                ),
              ),
            ),
            //Blog View
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommunituCartWidget(),
                    CommunituCartWidget(),
                    CommunituCartWidget(),
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
