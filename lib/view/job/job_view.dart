
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/job/widgets/job_cart_widget.dart';

import '../../res/components/colors.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: PreferredSize(

        preferredSize: const Size.square(70),
        child: AppBar(
          backgroundColor: AppColor.primaryColor,
          automaticallyImplyLeading: false,

          title:  Text('Jobboard',
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
      ),
      body: Padding(padding: const EdgeInsets.only(left: 16.0,right: 16.0),child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  VerticalSpeacing(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.filterPopup);
                },
                child: Row(
                  children: [
                   const  Icon(Icons.filter_alt_outlined,color: AppColor.primaryColor,),
                   const  SizedBox(width: 5.0),
                    Text('Filters',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.findJobView);
                },
                child: Row(
                  children: [
                    const  Icon(Icons.filter_list,color: AppColor.primaryColor,),
                    const  SizedBox(width: 5.0),
                    Text('Start Booking Jobs',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const VerticalSpeacing(10.0),
          Container(
            height: 250,
            width: double.infinity,
            color: AppColor.whiteColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpeacing(10.0),
                  Text('Jobboard',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Text('Officia irure irure anim exercitation velit\n cupidatat qui id ad. Officia irure irure',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(

                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grayColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(30.0),
                  Text('meet Nanny fairy ',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grayColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('13:00 To 14:00',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      Text('wijzig',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),

                    ],
                  ),
                  const Divider(),
                  const VerticalSpeacing(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('13:00 To 14:00',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      Text('wijzig',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),

                    ],
                  ),
                  const Divider(),



                ],
              ),
            ),

          ),
          const VerticalSpeacing(16.0),
          Text('To Do List',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
            ),
          ),
     const  VerticalSpeacing(12.0),
          JobCartWidget(),
          const  VerticalSpeacing(12.0),

          JobCartWidget(),
          
        ],
      ),),
    );
  }
}
