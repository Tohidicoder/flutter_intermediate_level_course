import 'dart:async';
import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    /// ANIMATION CONTROLLER
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    /// SCALE ANIMATION
    animation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.repeat(reverse: true);

    /// TIMER
    Timer(const Duration(seconds: 4), () {
      print("Splash Screen Finished");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6C63FF),

      body: Stack(
        children: [
          /// BACKGROUND DESIGN
          Positioned(
            top: -100,
            right: -80,

            child: Container(
              height: 250,
              width: 250,

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            left: -80,

            child: Container(
              height: 300,
              width: 300,

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// MAIN CONTENT
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                /// ANIMATED LOGO
                ScaleTransition(
                  scale: animation,

                  child: Container(
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      shape: BoxShape.circle,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),

                          blurRadius: 20,

                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 70,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// TITLE
                const Text(
                  "Welcome",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                /// SUBTITLE
                const Text(
                  "Beautiful Flutter Splash Screen",

                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),

                const SizedBox(height: 40),

                /// LOADING
                const CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
