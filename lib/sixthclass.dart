import 'package:flutter/material.dart';

enum Positions { endDocked, centerFloat, endFloat, centerDocked }

class LFloatingActionButton extends StatefulWidget {
  const LFloatingActionButton({super.key});

  @override
  State<LFloatingActionButton> createState() => _LFloatingActionButtonState();
}

class _LFloatingActionButtonState extends State<LFloatingActionButton> {
  FloatingActionButtonLocation fabLocation =
      FloatingActionButtonLocation.centerDocked;

  Positions selectedPosition = Positions.centerDocked;

  bool isNotched = false;
  bool isMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 242, 246),

      appBar: AppBar(
        title: const Text("FAB Controller"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 229, 41, 242),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// SETTINGS CARD
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 114, 114),
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: Column(
                children: [
                  const Text(
                    "FAB Settings",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  /// MINI FAB
                  SwitchListTile(
                    activeColor: const Color.fromARGB(255, 103, 240, 11),
                    title: const Text("Mini Floating Button"),

                    value: isMini,

                    onChanged: (value) {
                      setState(() {
                        isMini = value;
                      });
                    },
                  ),

                  /// NOTCHED SHAPE
                  SwitchListTile(
                    activeColor: const Color.fromARGB(255, 41, 238, 34),
                    title: const Text("Bottom Notched Shape"),

                    value: isNotched,

                    onChanged: (value) {
                      setState(() {
                        isNotched = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// POSITION CARD
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 6, 205),
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const Text(
                      "Select FAB Position",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    buildRadioTile(
                      title: "Center Docked",
                      value: Positions.centerDocked,

                      onChanged: (value) {
                        setState(() {
                          selectedPosition = value!;
                          fabLocation =
                              FloatingActionButtonLocation.centerDocked;
                        });
                      },
                    ),

                    buildRadioTile(
                      title: "End Docked",
                      value: Positions.endDocked,

                      onChanged: (value) {
                        setState(() {
                          selectedPosition = value!;
                          fabLocation = FloatingActionButtonLocation.endDocked;
                        });
                      },
                    ),

                    buildRadioTile(
                      title: "Center Float",
                      value: Positions.centerFloat,

                      onChanged: (value) {
                        setState(() {
                          selectedPosition = value!;
                          fabLocation =
                              FloatingActionButtonLocation.centerFloat;
                        });
                      },
                    ),

                    buildRadioTile(
                      title: "End Float",
                      value: Positions.endFloat,

                      onChanged: (value) {
                        setState(() {
                          selectedPosition = value!;
                          fabLocation = FloatingActionButtonLocation.endFloat;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 108, 237),

        mini: isMini,

        child: const Icon(Icons.add),

        onPressed: () {},
      ),

      floatingActionButtonLocation: fabLocation,

      /// BOTTOM BAR
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,

        shape: isNotched ? const CircularNotchedRectangle() : null,

        child: SizedBox(
          height: 60,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: const [
              Icon(Icons.home),

              Icon(Icons.search),

              SizedBox(width: 40),

              Icon(Icons.person),

              Icon(Icons.settings),
            ],
          ),
        ),
      ),
    );
  }

  /// RADIO TILE WIDGET
  Widget buildRadioTile({
    required String title,
    required Positions value,
    required Function(Positions?) onChanged,
  }) {
    return RadioListTile<Positions>(
      activeColor: const Color.fromARGB(255, 72, 177, 251),

      title: Text(title),

      value: value,

      groupValue: selectedPosition,

      onChanged: onChanged,
    );
  }
}
