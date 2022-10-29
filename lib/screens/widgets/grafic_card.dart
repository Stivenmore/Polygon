import 'package:divisas/domain/bussiness_logic/grafic/polygon_cubit.dart';
import 'package:divisas/screens/utils/colors.dart';
import 'package:divisas/screens/widgets/custom_grafic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class GraficCard extends StatelessWidget {
  const GraficCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final status = context.select((PolygonCubit value) => value.state.status);
      switch (status) {
        case PolygonStateStatus.loaded:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kColorgrayPallet),
            child: Column(
              children: [
                Text(
                  "TRM USD > COP",
                  style: GoogleFonts.roboto(),
                ),
                const CustomGrafic(),
              ],
            ),
          );
        case PolygonStateStatus.loading:
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: const [
                CustomGrafic(),
              ],
            ),
          );
        case PolygonStateStatus.error:
          return SizedBox(
              height: 150,
              width: 150,
              child: Text(
                  "Sin informacion local para cargar, revise su conexion"));
        default:
          return Container();
      }
    });
  }
}
