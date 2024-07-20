import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget gridTile(
    {String? imageUrl, String? heading, String? subHeading, String? price}) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate((context, index) {
      return SizedBox(
        child: Card(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                imageUrl!,
                height: 70,
                width: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                heading!,
                style: GoogleFonts.spaceMono(
                    color: const Color(0xffeb3254),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subHeading!,
                style: GoogleFonts.spaceMono(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    price!.toString(),
                    style: GoogleFonts.spaceMono(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffeb3254),
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  );
}
