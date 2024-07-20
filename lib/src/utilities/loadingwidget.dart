import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingWidget() {
  return Center(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      LoadingAnimationWidget.inkDrop(color: const Color(0xffeb3254), size: 25),
      const SizedBox(
        width: 10,
      ),
      Text(
        "please wait...",
        style: GoogleFonts.spaceMono(
            color: const Color(0xffeb3254),
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
    ],
  ));
}
