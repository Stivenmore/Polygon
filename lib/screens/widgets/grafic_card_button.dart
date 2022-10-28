import 'package:divisas/domain/bussiness_logic/grafic/polygon_cubit.dart';
import 'package:divisas/screens/utils/colors.dart';
import 'package:divisas/screens/utils/constant.dart';
import 'package:divisas/screens/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class GraficCardButton extends StatelessWidget {
  const GraficCardButton({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      int currentSelect =
          context.select((PolygonCubit value) => value.state.currentSelect);
      final cubit = context.read<PolygonCubit>();
      final status = context.select((PolygonCubit value) => value.state.status);
      switch (status) {
        case PolygonStateStatus.loaded:
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              height: 30,
              width: responsive.wp(90),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listbutton.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        currentSelect != index
                            ? cubit.aggregatesBarGet(index)
                            : null;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: responsive.wp(5)),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                              color: currentSelect == index
                                  ? Colors.white
                                  : kColorBlue,
                              borderRadius: BorderRadius.circular(18),
                              border: currentSelect == index
                                  ? Border.all(
                                      color:
                                          kColorgrayPalletHard.withOpacity(0.5))
                                  : null),
                          child: Center(
                              child: Text(
                            listbutton[index],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: currentSelect == index
                                        ? Colors.black
                                        : Colors.white)),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          );
        case PolygonStateStatus.loading:
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 30,
                width: responsive.wp(90),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listbutton.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          currentSelect != index
                              ? cubit.aggregatesBarGet(index)
                              : null;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: responsive.wp(5)),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 10,
                            width: 40,
                            decoration: BoxDecoration(
                                color: currentSelect == index
                                    ? Colors.white
                                    : kColorBlue,
                                borderRadius: BorderRadius.circular(18),
                                border: currentSelect == index
                                    ? Border.all(
                                        color: kColorgrayPalletHard
                                            .withOpacity(0.5))
                                    : null),
                            child: Center(
                                child: Text(
                              listbutton[index],
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: currentSelect == index
                                          ? Colors.white
                                          : Colors.black)),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        default:
          return Container();
      }
    });
  }
}
