import 'package:divisas/screens/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardCurrency extends StatelessWidget {
  const ShimmerCardCurrency({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.only(top: 35),
        height: 160,
        width: responsive.width,
        decoration: BoxDecoration(
            color: const Color(0xffAFAFAF).withOpacity(0.3),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$ ******* ",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.w400)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 7, left: 5),
                  height: 15,
                  width: 35,
                  decoration: BoxDecoration(
                      color: const Color(0xff0073E6),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "*****",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 10)),
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
                    const Text("** ****"),
                    Text(
                      '**** *** ****',
                      style: GoogleFonts.roboto(
                          color: const Color(0xff0073E6), fontSize: 11),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
