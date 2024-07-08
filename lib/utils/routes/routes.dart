import 'package:flutter/material.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/auth/login_or_signup_view.dart';
import 'package:nanny_fairy/view/auth/signup/fill_prefrences_view.dart';
import 'package:nanny_fairy/view/auth/signup/register_details.dart';
import 'package:nanny_fairy/view/auth/signup/select_passion_view.dart';
import 'package:nanny_fairy/view/auth/signup/select_preference.dart';
import 'package:nanny_fairy/view/auth/signup/upload_image.dart';
import 'package:nanny_fairy/view/booked/booked_view.dart';
import 'package:nanny_fairy/view/chat/chat_view.dart';
import 'package:nanny_fairy/view/community/community_view.dart';
import 'package:nanny_fairy/view/community/upload_comunity_post.dart';
import 'package:nanny_fairy/view/home/dashboard/dashboard.dart';
import 'package:nanny_fairy/view/home/home_view.dart';
import 'package:nanny_fairy/view/job/job_view.dart';
import 'package:nanny_fairy/view/notifications/notifications_view.dart';
import 'package:nanny_fairy/view/onboarding/splash_view.dart';
import 'package:nanny_fairy/view/payment/payment.dart';
import 'package:nanny_fairy/view/profile/edit_profile.dart';
import 'package:nanny_fairy/view/profile/my_profile.dart';
import 'package:nanny_fairy/view/profile/profile_view.dart';
import 'package:nanny_fairy/view/rating/add_rating.dart';
import 'package:nanny_fairy/view/rating/rating.dart';
import 'package:nanny_fairy/view/settings/settings_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      case RoutesName.loginOrSignup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginOrSignupView());
      case RoutesName.selectPassion:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SelectPassionView());
      case RoutesName.registerDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterDetails());
      case RoutesName.uploadImg:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UploadImage());
      case RoutesName.selectPreference:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SelectPreference());
      case RoutesName.fillpreferenceView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FillPreferenceView());
      case RoutesName.fillpreferenceView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FillPreferenceView());
      case RoutesName.jobView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const JobView());
      case RoutesName.chatView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChatView());
      case RoutesName.bookedView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BookedView());
      case RoutesName.communityView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CommunityView());
      case RoutesName.profileView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfileView());
      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashBoardScreen());
      case RoutesName.uploadCommunityPost:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UploadComunityPost());
      case RoutesName.myProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyProfile());
      case RoutesName.editProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EditProfile());
      case RoutesName.notificationsView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotificationsView());
      case RoutesName.settingsView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsView());
      case RoutesName.paymentView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PaymentView());
      case RoutesName.totalRating:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TotalRatingScreen());
      case RoutesName.addRating:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Rating());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}