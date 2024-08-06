import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/ViewModel/auth_view_model.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../../../res/components/colors.dart';
import '../../../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const VerticalSpeacing(60.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 163,
                          width: 185,
                          child: Center(
                            child: Image.asset('images/splash.png'),
                          ),
                        ),
                        const VerticalSpeacing(12.0),
                        Text(
                          'Welcome to our',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                        Text(
                          'Nanny fairy',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
              const VerticalSpeacing(30.0),
               TextFieldCustom(
                controller: emailController,
                  maxLines: 1, hintText: 'hasnainDev@gmail.com'),
               TextFieldCustom(
                  controller: passwordController,
                  maxLines: 1, hintText: '*********'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.forgetPass);
                    },
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(60.0),
              RoundedButton(
                  title: 'Login',
                  onpress: () {
                    if (passwordController.text.isNotEmpty ||
                        emailController.text.isNotEmpty) {
                      authController.loginAccount(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context);
                    } else {
                      Utils.toastMessage(
                          "Login Failed!");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
