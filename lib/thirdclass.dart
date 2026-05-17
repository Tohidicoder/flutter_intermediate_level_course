import 'package:flutter/material.dart';

class LPageView extends StatefulWidget {
  @override
  State<LPageView> createState() => _LPageViewState();
}

class _LPageViewState extends State<LPageView> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "color": Colors.deepPurple,
      "icon": Icons.swipe,
      "title": "Swipe Up",
      "desc": "Move between pages",
    },
    {
      "color": Colors.pink,
      "icon": Icons.favorite,
      "title": "Love UI",
      "desc": "Beautiful Flutter design",
    },
    {
      "color": Colors.orange,
      "icon": Icons.star,
      "title": "Star Page",
      "desc": "Amazing experience",
    },
    {
      "color": Colors.blue,
      "icon": Icons.flutter_dash,
      "title": "Flutter",
      "desc": "Build apps easily",
    },
    {
      "color": Colors.green,
      "icon": Icons.code,
      "title": "Coding",
      "desc": "Practice every day",
    },
    {
      "color": Colors.redAccent,
      "icon": Icons.phone_android,
      "title": "Mobile",
      "desc": "Android & iOS apps",
    },
    {
      "color": Colors.teal,
      "icon": Icons.rocket_launch,
      "title": "Launch",
      "desc": "Go next level",
    },
    {
      "color": Colors.indigo,
      "icon": Icons.done_all,
      "title": "Finish",
      "desc": "You completed all pages",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final page = pages[index];

              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [page["color"], Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(page["icon"], size: 110, color: Colors.white),

                    SizedBox(height: 20),

                    Text(
                      page["title"],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      page["desc"],
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              );
            },
          ),

          // Indicator dots
          Positioned(
            right: 15,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: currentIndex == index ? 12 : 8,
                  height: currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white54,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
