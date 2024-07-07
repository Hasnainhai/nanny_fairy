

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ToggleRadioButton extends StatefulWidget {
  final String label;

  const ToggleRadioButton({super.key, required this.label});

  @override
  _ToggleRadioButtonState createState() => _ToggleRadioButtonState();
}

class _ToggleRadioButtonState extends State<ToggleRadioButton> {
  bool isSelected = false;

  void _handleTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColor.boxFillColor,
      child: GestureDetector(
        onTap: _handleTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Transform.scale(
                scale: 1,
                child: Radio<bool>(
                  value: isSelected,
                  groupValue: true,
                  onChanged: (value) {
                    _handleTap();
                  },
                  activeColor: AppColor.primaryColor,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
