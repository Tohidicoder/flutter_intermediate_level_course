import 'package:flutter/material.dart';

// import 'eightclass.dart';
// import 'eleventhclass.dart';
// import 'fifthclass.dart';
// import 'firstclass.dart';
// import 'fouthclass.dart';
// import 'ninthclass.dart';
// import 'secondclass.dart';
// import 'seventhclass.dart';
// import 'sixthclass.dart';
// import 'tenthclass.dart';
// import 'thirdclass.dart';

import 'package:flutter_intermediate_level_course/eightclass.dart';
import 'package:flutter_intermediate_level_course/eleventhclass.dart';
import 'package:flutter_intermediate_level_course/fifthclass.dart';
import 'package:flutter_intermediate_level_course/firstclass.dart';
import 'package:flutter_intermediate_level_course/fouthclass.dart';
import 'package:flutter_intermediate_level_course/ninthclass.dart';
import 'package:flutter_intermediate_level_course/secondclass.dart';
import 'package:flutter_intermediate_level_course/seventhclass.dart';
import 'package:flutter_intermediate_level_course/sixthclass.dart';
import 'package:flutter_intermediate_level_course/tenthclass.dart';
import 'package:flutter_intermediate_level_course/thirdclass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstFile());
  }
}

class FirstFile extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"title": "Tooltip Example", "page": LTooltip(), "icon": Icons.touch_app},
    {"title": "Placeholder", "page": LPlaceholder(), "icon": Icons.image},
    {"title": "PageView", "page": LPageView(), "icon": Icons.view_carousel},
    {
      "title": "Radio Button",
      "page": LRadio(),
      "icon": Icons.radio_button_checked,
    },
    {"title": "Checkbox", "page": LCheckBox(), "icon": Icons.check_box},
    {"title": "FAB", "page": LFloatingActionButton(), "icon": Icons.add_circle},
    {"title": "AbsorbPointer", "page": LAbsorbPointer(), "icon": Icons.block},
    {
      "title": "IndexedStack",
      "page": LIndexedStackState(),
      "icon": Icons.layers,
    },
    {"title": "Splash 1", "page": Splash1(), "icon": Icons.flash_on},
    {"title": "Splash 2", "page": Splash2(), "icon": Icons.flash_on},
    {"title": "Profile", "page": Profile1(), "icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flutter Learning App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Choose an example to start",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 16),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),

                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),

                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),

                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(item["icon"], color: Colors.black),
                        ),

                        title: Text(
                          item["title"],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          "Tap to open",
                          style: TextStyle(color: Colors.white70),
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 18,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item["page"],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
