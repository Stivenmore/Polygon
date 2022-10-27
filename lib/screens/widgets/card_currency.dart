import 'package:divisas/domain/models/currency_conversion_model.dart';
import 'package:divisas/screens/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCurrency extends StatelessWidget {
  const CardCurrency({
    Key? key,
    required this.responsive,
    required this.model,
  }) : super(key: key);

  final Responsive responsive;
  final CurrencyConversionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      height: 160,
      width: responsive.width,
      decoration: BoxDecoration(
          color: const Color(0xffAFAFAF).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$ ${model.ask}",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 38, fontWeight: FontWeight.w400)),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 7,
                  left: 5,
                ),
                height: 15,
                width: 35,
                decoration: BoxDecoration(
                    color: const Color(0xff0073E6),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "COP",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.error_rounded,
                  size: 16,
                ),
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("= 1 USD"),
                  Text(
                    model.time,
                    style: GoogleFonts.roboto(
                        color: const Color(0xff0073E6), fontSize: 11),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
