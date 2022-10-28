import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;

  Map mapa = {
    1.000: "1000",
    2.000: "2000",
    3.000: "3000",
    3.500: "3500",
    4.000: "4000",
    4.500: "4500",
    4.800: "4800",
    4.850: "4850",
    4.900: "4900",
    5.000: "5000"
  };

  text = mapa[value] ?? "";

  return Text(text, style: style, textAlign: TextAlign.left);
}

List listbutton = ["2Y", "1Y", "1M", "5d", "24h"];

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
