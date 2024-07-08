import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/view/notifications/widgets/notifications_widget.dart';
import '../../res/components/colors.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'Notifications',
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
            )),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
              NotificationsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
