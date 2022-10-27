import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tasa de cambios",
            style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(78),
              gradient: const LinearGradient(
                  colors: [Color(0xffCEFF00), Colors.white],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft),
            ),
            child: const Icon(Icons.person_outline_outlined),
          )
        ],
      ),
    );
  }
}
