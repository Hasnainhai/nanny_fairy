import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/toggle_widget.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({
    super.key,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  bool firstButton = true;
  bool secondButton = false;
  bool thirdButton = false;

  void paymentDonePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle,
                  color: AppColor.primaryColor, size: 150),
              const VerticalSpeacing(16),
              Text(
                'Payment Done Congratulations You\n are subscribed now',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const VerticalSpeacing(30),
              RoundedButton(
                title: 'Continue to Chat',
                onpress: () {
                  Navigator.pushNamed(context, RoutesName.chatView);
                },
              ),
              const VerticalSpeacing(16),
            ],
          ),
        );
      },
    );
  }

  void initiatePaypalCheckout(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckout(
        sandboxMode: true,
        secretKey:
            "EM-G9jSv4x5GAFEge8DRMD0figp3V68YifKmhK4enbGCKDHKq3jYlOwwk8Q8s7NQMsZ1oxg_5vJ2s3xn",
        clientId:
            "AcdlPX5qScKqycqMVzxDYKxvg31yhOHPLSzx4_KeMCA-ofV2VRvWlKOuz-RjWR098YXESEX9YUloLBd8",
        returnURL: "http://api.sandbox.paypal.com",
        cancelURL: "http://api.sandbox.paypal.com",
        transactions: const [
          {
            "amount": {
              "total": '2',
              "currency": "EUR",
              "details": {
                "subtotal": '2',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "1 Year Subscription",
            "item_list": {
              "items": [
                {
                  "name": "1 Year Subscription",
                  "quantity": 1,
                  "price": '2', // Charge for subscription
                  "currency": "EUR"
                }
              ],
            }
          }
        ],
        note: "1 Year Subscription for 2 Euros",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Add Payment Details ',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpeacing(20),
                const Text(
                  'Select Payment Type',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(20.0),
                SizedBox(
                  height: 66,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                firstButton = !firstButton;
                                secondButton = false;
                                thirdButton = false;
                              });
                            },
                            child: Center(
                              child: Container(
                                height: 66,
                                width: 135,
                                decoration: BoxDecoration(
                                  color: firstButton
                                      ? AppColor.primaryColor
                                      : AppColor.secondaryBgColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: firstButton
                                        ? AppColor.blackColor
                                        : Colors.transparent,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff1B81BC).withOpacity(
                                          0.1), // Drop shadow color with 4% opacity
                                      blurRadius: 2,
                                      offset: const Offset(1, 2),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 40.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('images/idle.png'),
                                              fit: BoxFit.contain)),
                                    ),
                                    const VerticalSpeacing(5),
                                    Text(
                                      "IDLE",
                                      style: TextStyle(
                                          fontFamily: 'CenturyGothic',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: firstButton
                                              ? AppColor.whiteColor
                                              : AppColor.blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                firstButton = false;
                                secondButton = false;
                                thirdButton = !thirdButton;
                              });
                            },
                            child: Center(
                              child: Container(
                                height: 66,
                                width: 135,
                                decoration: BoxDecoration(
                                  color: thirdButton
                                      ? AppColor.primaryColor
                                      : AppColor.secondaryBgColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: thirdButton
                                        ? AppColor.blackColor
                                        : Colors.transparent,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff1B81BC).withOpacity(
                                          0.1), // Drop shadow color with 4% opacity
                                      blurRadius: 2,
                                      offset: const Offset(1, 2),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/paypal.png'),
                                              fit: BoxFit.contain)),
                                    ),
                                    const VerticalSpeacing(5),
                                    Text(
                                      "Paypal",
                                      style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: thirdButton
                                            ? AppColor.whiteColor
                                            : AppColor.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const VerticalSpeacing(30),
                const TextFieldCustom(
                  maxLines: 1,
                  hintText: 'Card Name',
                ),
                const TextFieldCustom(
                  maxLines: 1,
                  hintText: ' Enter Card Number',
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCustom(
                      maxLines: 1,
                      hintText: 'Expiration Date',
                    )),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldCustom(
                        maxLines: 1,
                        hintText: 'CVV',
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(16.0),
                const ToggleWidget(title: 'Remeber My Card Details'),
                const VerticalSpeacing(46.0),
                RoundedButton(
                    title: 'Pay',
                    onpress: () {
                      initiatePaypalCheckout(context);
                      // paymentDonePopup(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
