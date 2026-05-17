import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    /// CONTROLLER
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    /// CURVE
    CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    /// FADE ANIMATION
    animation = Tween<double>(begin: 0.2, end: 1.0).animate(curve);

    /// REPEAT ANIMATION
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 73, 248),

      body: Center(
        child: FadeTransition(
          opacity: animation,

          child: Container(
            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),

              borderRadius: BorderRadius.circular(30),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),

                  blurRadius: 20,

                  offset: const Offset(0, 10),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const FlutterLogo(size: 120),

                const SizedBox(height: 20),

                const Text(
                  "Flutter Animation",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 28,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Beautiful Fade Splash Screen",

                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
