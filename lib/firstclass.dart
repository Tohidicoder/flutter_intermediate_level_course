import 'package:flutter/material.dart';

class LTooltip extends StatelessWidget {
  const LTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tooltip Example"), centerTitle: true),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          const Center(
            child: Text(
              "Long Press on Boxes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // GREEN
          Center(
            child: Tooltip(
              message: "Green",

              child: Container(height: 100, width: 100, color: Colors.green),
            ),
          ),

          // YELLOW
          Center(
            child: Tooltip(
              message: "Yellow",

              child: Container(height: 100, width: 100, color: Colors.yellow),
            ),
          ),

          // BLUE
          Center(
            child: Tooltip(
              message: "Blue",

              child: Container(height: 100, width: 100, color: Colors.blue),
            ),
          ),

          // RED
          Center(
            child: Tooltip(
              message: "Red",

              child: Container(height: 100, width: 100, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
