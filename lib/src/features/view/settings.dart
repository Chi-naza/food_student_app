import 'package:flutter/material.dart';
import 'package:food_app2/src/utilities/settingstiles.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    )),
                const SizedBox(
                  width: 270,
                ),
                Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.sunny,
                      color: Colors.white,
                      size: 20,
                    )),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            //image profile
            Center(
              child: Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      Positioned(
                          right: 5,
                          bottom: 3,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),

            // user details
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Victor Adams",
                  style: GoogleFonts.spaceMono(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "victorAdams45@gmail.com",
                  style: GoogleFonts.spaceMono(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffeb3254)),
                  child: Text(
                    "Upgrade to PRO",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // settings details
                settingTiles(
                    leadingIcon: Icons.security,
                    titleText: "Privacy",
                    trailingIcon: Icons.arrow_forward),
                const SizedBox(
                  height: 10,
                ),
                settingTiles(
                    leadingIcon: Icons.receipt,
                    titleText: "Purchase history",
                    trailingIcon: Icons.arrow_forward),
                const SizedBox(
                  height: 10,
                ),
                settingTiles(
                    leadingIcon: Icons.question_mark,
                    titleText: "Help and support",
                    trailingIcon: Icons.arrow_forward),
                const SizedBox(
                  height: 10,
                ),
                settingTiles(
                    leadingIcon: Icons.group_add,
                    titleText: "Invite a friend",
                    trailingIcon: Icons.arrow_forward),
                const SizedBox(
                  height: 10,
                ),
                settingTiles(
                    leadingIcon: Icons.logout,
                    titleText: "Log out",
                    trailingIcon: Icons.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
