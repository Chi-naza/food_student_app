import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget settingTiles(
    {IconData? leadingIcon, String? titleText, IconData? trailingIcon}) {
  return Container(
    height: 50,
    width: 320,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey),
    child: ListTile(
      leading: Icon(
        leadingIcon,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        titleText!,
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        trailingIcon,
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}
