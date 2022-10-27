import 'package:divisas/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  Container(
      alignment: Alignment.center, child: const Icon(Icons.animation_sharp)),
  const HomeScreen(),
  Container(alignment: Alignment.center, child: const Icon(Icons.addchart)),
  Container(
      alignment: Alignment.center, child: const Icon(Icons.add_link_sharp)),
  Container(
      alignment: Alignment.center,
      child: const Icon(Icons.account_tree_rounded)),
];

List<Widget> indexTap = [
  Container(
      alignment: Alignment.center, child: const Icon(Icons.animation_sharp)),
  Container(
      alignment: Alignment.center, child: const Icon(Icons.grid_off_sharp)),
  Container(alignment: Alignment.center, child: const Icon(Icons.addchart)),
  Container(
      alignment: Alignment.center, child: const Icon(Icons.add_link_sharp)),
  Container(
      alignment: Alignment.center,
      child: const Icon(Icons.account_tree_rounded)),
];
