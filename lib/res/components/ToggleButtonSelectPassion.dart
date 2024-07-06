

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleRadioButton extends StatefulWidget {
  final String label;

  const ToggleRadioButton({Key? key, required this.label}) : super(key: key);

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
    return GestureDetector(
      onTap: _handleTap,
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
                color: Colors.black, // Use AppColor.blackColor if defined
              ),
            ),
          ),
          Transform.scale(
            scale: 1.5, // Adjust the scale factor to change the size
            child: Radio<bool>(
              value: isSelected,
              groupValue: true,
              onChanged: (value) {
                _handleTap();
              },
              activeColor: Colors.blue, // Change this to your desired color
            ),
          ),
        ],
      ),
    );
  }
}
