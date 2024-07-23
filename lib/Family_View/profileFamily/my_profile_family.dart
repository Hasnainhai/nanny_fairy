import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../res/components/colors.dart';

class MyProfileFamily extends StatelessWidget {
  const MyProfileFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Your Profile Details',
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.west,
            color: AppColor.whiteColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.editProfileFamily);
            },
            icon: const Icon(
              Icons.border_color_outlined,
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileItem(
                  icon: Icons.person,
                  label: 'Name',
                  value: 'Hassnain Haider',
                ),
                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.location_on,
                  label: 'Address',
                  value: 'E-11 block Islamabad',
                ),

                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.phone,
                  label: 'Telephone Number',
                  value: '+923129739152',
                ),
                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.cake,
                  label: 'Date of Birth',
                  value: '12/11/2003',
                ),
                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.email,
                  label: 'Email Address',
                  value: 'Hassnain@gmail.com',
                ),
                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.lock,
                  label: 'Password',
                  value: '***********',
                ),
                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.lock,
                  label: 'Confirm Password',
                  value: '*********',
                ),
                Divider(),
                VerticalSpeacing(10.0),
                ProfileItem(
                  icon: Icons.description,
                  label: 'Description',
                  value: 'My name is Hasnain, I am a software engineer.',
                ),

                VerticalSpeacing(16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColor.primaryColor,size: 20,),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
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
          ),
        ],
      ),
    );
  }
}
