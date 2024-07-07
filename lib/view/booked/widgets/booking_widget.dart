import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import '../../../res/components/colors.dart';

class BookingCartWidget extends StatefulWidget {
  const BookingCartWidget({super.key});

  @override
  State<BookingCartWidget> createState() => _BookingCartWidgetState();
}

class _BookingCartWidgetState extends State<BookingCartWidget> {

  // popUp
  void showSignupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(),
          icon: const ImageIcon(
            AssetImage('images/popImg.png'), size: 120,),
          title:  Text('Agree to Subscription of\n€2/month',style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
            ),
          ), ),
          content: RoundedButton(title: 'subscribe and chat',onpress: (){},)
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 88,
        width: double.infinity,

        decoration: BoxDecoration(
          color: AppColor.boxFillColor,
          borderRadius: BorderRadius.circular(10.0),

        ),
        child: Center(
          child: ListTile(
            leading: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(image: NetworkImage('https://www.shutterstock.com/image-photo/family-selfie-portrait-grandparents-children-260nw-2352440117.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              'Hassnain',
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
            ),
            subtitle: Text(
              'Family\n⭐ 4.8 (456 Reviews)',
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.grayColor,
                ),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'hours rate',
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    showSignupDialog(context);
                  },
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primaryColor,
                    ),
                    child: Center(child:Text(
                      'View',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ), ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}