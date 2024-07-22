import 'package:flutter/material.dart';
import 'package:nanny_fairy/Family_View/profileFamily/widgets/profile_widget_family.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';
import '../../view/rating/rating.dart';

class ProfileViewFamily extends StatefulWidget {
  const ProfileViewFamily({super.key});

  @override
  State<ProfileViewFamily> createState() => _ProfileViewFamilyState();
}

class _ProfileViewFamilyState extends State<ProfileViewFamily> {
  final double tHeight = 150.0;
  final double top = 130.0;
  String defaultProfile =
      'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: const Text(
          'Profile ',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor,
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                _buildCoverBar(),
                Container(
                  padding:
                      const EdgeInsets.only(top: 10, left: 24.0, right: 24.0),
                  child: _buildProfile(),
                ),
              ],
            ),
            const VerticalSpeacing(16.0),
            _buildProfileFeatures(),
          ],
        ),
      ),
    );
  }

  _buildCoverBar() {
    return Container(
      height: tHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        color: AppColor.primaryColor,
      ),
    );
  }

  _buildProfile() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(defaultProfile),
        ),
        const SizedBox(width: 20.0),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpeacing(
              8,
            ),
            Text(
              'Hasnain haidr',
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildProfileFeatures() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                ProfileWidgetsFamily(
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.myProfile);
                  },
                  tColor: AppColor.primaryColor,
                  bColor: AppColor.primaryColor,
                  icon: Icons.person_outline,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'My Profile',
                ),
                const Divider(),
                ProfileWidgetsFamily(
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.notificationsView);
                  },
                  tColor: AppColor.primaryColor,
                  bColor: AppColor.primaryColor,
                  icon: Icons.notifications_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'Notifications',
                ),
                const Divider(),
                ProfileWidgetsFamily(
                    ontap: () {
                      Navigator.pushNamed(context, RoutesName.settingsView);
                    },
                    tColor: AppColor.primaryColor,
                    bColor: AppColor.primaryColor,
                    icon: Icons.settings_outlined,
                    trIcon: Icons.arrow_forward_ios,
                    title: 'Settings'),
                const Divider(),
                ProfileWidgetsFamily(
                    ontap: () {
                      Navigator.pushNamed(context, RoutesName.paymentView);
                    },
                    tColor: AppColor.primaryColor,
                    bColor: AppColor.primaryColor,
                    icon: Icons.account_balance_wallet_outlined,
                    trIcon: Icons.arrow_forward_ios,
                    title: 'Payment'),
                const Divider(),
                ProfileWidgetsFamily(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const TotalRatingScreen()));
                  },
                  tColor: AppColor.primaryColor,
                  bColor: AppColor.primaryColor,
                  icon: Icons.star_outline,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'Ratings',
                ),
                const Divider(),
                ProfileWidgetsFamily(
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.loginView);
                  },
                  tColor: AppColor.primaryColor,
                  bColor: AppColor.primaryColor,
                  icon: Icons.logout_outlined,
                  trIcon: Icons.arrow_forward_ios,
                  title: 'Log Out',
                ),
                const Divider(),
                const VerticalSpeacing(60.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
