import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:spend_savvy/OnbordingScreen/skip%20page%20view/page_view.dart';

import 'package:spend_savvy/models/category/category_model.dart';

import '../widgets/bottonm google/gbottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Splashscreens.getdata();
    Splashscreens.getdata().values.isEmpty
        ? const Pageview()
        : const Bottomnav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 10, 92, 130),
              Color.fromARGB(255, 228, 221, 221),
            ]),
        shape: BoxShape.rectangle,
      ),
      child: AnimatedSplashScreen(
        duration: 1700,
        backgroundColor: Colors.transparent,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Splashscreens.getdata().values.isEmpty
            ? const Pageview()
            : const Bottomnav(),
        splash: Scaffold(
          backgroundColor: Colors.transparent,
          body: Wrap(
            children: [
              Center(
                child: Text(
                  'Spend Savvy',
                  style: GoogleFonts.acme(fontSize: 30),
                ),
              ),
              const Center(child: Text('version 1.0.2')),
              // Center(
              //   child: SizedBox(
              //       height: 100,
              //       width: 100,
              //       child: Image.asset(
              //           'lib/assets/output-onlinegiftools (3).gif')),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
