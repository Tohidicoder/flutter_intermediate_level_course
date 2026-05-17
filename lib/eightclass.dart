import 'package:flutter/material.dart';

class LIndexedStackState extends StatefulWidget {
  const LIndexedStackState({super.key});

  @override
  State<LIndexedStackState> createState() => _LIndexedStackStateState();
}

class _LIndexedStackStateState extends State<LIndexedStackState> {
  int _index = 0;

  final List<Map<String, dynamic>> pages = [
    {"title": "Home", "color": Colors.yellow, "icon": Icons.home},
    {"title": "Search", "color": Colors.green, "icon": Icons.search},
    {"title": "Profile", "color": Colors.red, "icon": Icons.person},
    {"title": "Settings", "color": Colors.amber, "icon": Icons.settings},
    {"title": "Chat", "color": Colors.blue, "icon": Icons.chat},
    {"title": "Favorites", "color": Colors.pink, "icon": Icons.favorite},
    {
      "title": "Notifications",
      "color": Colors.orange,
      "icon": Icons.notifications,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        title: const Text("IndexedStack Extended Demo"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Column(
        children: [
          /// TOP INFO CARD
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Current Screen: ${pages[_index]["title"]}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// INDEXED STACK
          Expanded(
            child: IndexedStack(
              index: _index,
              children: List.generate(pages.length, (i) {
                return _buildPage(
                  pages[i]["color"],
                  pages[i]["title"],
                  pages[i]["icon"],
                );
              }),
            ),
          ),

          /// NAV BUTTONS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = (_index - 1 < 0) ? pages.length - 1 : _index - 1;
                    });
                  },
                  child: const Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = (_index + 1) % pages.length;
                    });
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// PAGE DESIGN
  Widget _buildPage(Color color, String text, IconData icon) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: color,

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 90, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
