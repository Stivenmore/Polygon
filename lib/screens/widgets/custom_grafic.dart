import 'package:divisas/domain/bussiness_logic/grafic/polygon_cubit.dart';
import 'package:divisas/domain/entities/aggregates_bar_entity.dart';
import 'package:divisas/screens/utils/colors.dart';
import 'package:divisas/screens/utils/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGrafic extends StatefulWidget {
  const CustomGrafic({super.key});

  @override
  State<CustomGrafic> createState() => _CustomGraficState();
}

class _CustomGraficState extends State<CustomGrafic> {
  bool isVisible = false;
  String date = '';

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<PolygonCubit>();
      AggregateBarEntity model = context
          .select((PolygonCubit cubit) => cubit.state.aggregateBarEntity);
      final bottons = context.select(
        (PolygonCubit value) => value.state,
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: LineChart(mainData(model, bottons, cubit)),
            ),
          ),
          Builder(builder: (context) {
            final label = context.select(
              (PolygonCubit value) => value.state.label,
            );
            return Text(
              label,
              style: GoogleFonts.roboto(fontSize: 16),
            );
          })
        ],
      );
    });
  }
}

LineChartData mainData(
    AggregateBarEntity model, PolygonState state, PolygonCubit cubit) {
  return LineChartData(
    lineTouchData: LineTouchData(
      enabled: true,
      touchCallback: (p0, p1) {
        cubit.changeLabelGrafic('...');
        print("End");
      },
      getTouchLineStart: (barData, spotIndex) {
        cubit.changeLabelGrafic(model.result[spotIndex].t);
        print("Start");
        return 2.0;
      },
    ),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.white12,
          strokeWidth: 0.1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: kColorgrayPallet,
          strokeWidth: 0.1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: kColorgrayPallet),
    ),
    minX: 0,
    maxX: double.parse(model.result.length.toString()),
    minY: 0,
    maxY: 6.0,
    lineBarsData: [
      LineChartBarData(
        spots: List.generate(model.result.length, (index) {
          final t = model.result[index].l.toString().replaceAll('.', '');
          final y =
              "${t.toString()[0]}.${t.toString().substring(1, t.length > 3 ? 4 : 3)}";
          return FlSpot(double.parse(index.toString()), double.parse(y));
        }),
        preventCurveOverShooting: true,
        isCurved: true,
        gradient: LinearGradient(
            colors: kPersistengradientColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                kgradientColor.map((color) => color.withOpacity(0.6)).toList(),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ],
  );
}
