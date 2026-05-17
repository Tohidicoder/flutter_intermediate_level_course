import 'package:flutter/material.dart';

class LCheckBox extends StatefulWidget {
  const LCheckBox({super.key});

  @override
  State<LCheckBox> createState() => _LCheckBoxState();
}

class _LCheckBoxState extends State<LCheckBox> {
  List<String> selectedGames = [];

  bool isFootball = false;
  bool isCricket = false;
  bool isVolleyBall = false;
  bool isKabaddi = false;
  bool isBaseball = false;
  bool isBasketBall = false;
  bool isOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        title: const Text("Checkbox Example"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// Top Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                children: [
                  const SizedBox(height: 15),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sports_esports,
                        color: Colors.deepPurple,
                        size: 30,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Select Your Favorite Games",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  buildCheckBox(
                    title: "Football",
                    value: isFootball,
                    icon: Icons.sports_soccer,
                    color: Colors.green,

                    onChanged: (value) {
                      setState(() {
                        isFootball = value!;
                        isFootball
                            ? selectedGames.add("Football")
                            : selectedGames.remove("Football");
                      });
                    },
                  ),

                  buildCheckBox(
                    title: "Cricket",
                    value: isCricket,
                    icon: Icons.sports_cricket,
                    color: Colors.orange,

                    onChanged: (value) {
                      setState(() {
                        isCricket = value!;
                        isCricket
                            ? selectedGames.add("Cricket")
                            : selectedGames.remove("Cricket");
                      });
                    },
                  ),

                  buildCheckBox(
                    title: "Basketball",
                    value: isBasketBall,
                    icon: Icons.sports_basketball,
                    color: Colors.deepOrange,

                    onChanged: (value) {
                      setState(() {
                        isBasketBall = value!;
                        isBasketBall
                            ? selectedGames.add("Basketball")
                            : selectedGames.remove("Basketball");
                      });
                    },
                  ),

                  buildCheckBox(
                    title: "Baseball",
                    value: isBaseball,
                    icon: Icons.sports_baseball,
                    color: Colors.blue,

                    onChanged: (value) {
                      setState(() {
                        isBaseball = value!;
                        isBaseball
                            ? selectedGames.add("Baseball")
                            : selectedGames.remove("Baseball");
                      });
                    },
                  ),

                  buildCheckBox(
                    title: "Volleyball",
                    value: isVolleyBall,
                    icon: Icons.sports_volleyball,
                    color: Colors.purple,

                    onChanged: (value) {
                      setState(() {
                        isVolleyBall = value!;
                        isVolleyBall
                            ? selectedGames.add("Volleyball")
                            : selectedGames.remove("Volleyball");
                      });
                    },
                  ),

                  buildCheckBox(
                    title: "Kabaddi",
                    value: isKabaddi,
                    icon: Icons.sports,
                    color: Colors.red,

                    onChanged: (value) {
                      setState(() {
                        isKabaddi = value!;
                        isKabaddi
                            ? selectedGames.add("Kabaddi")
                            : selectedGames.remove("Kabaddi");
                      });
                    },
                  ),

                  buildCheckBox(
                    title: "Other Game",
                    value: isOther,
                    icon: Icons.games,
                    color: Colors.teal,

                    onChanged: (value) {
                      setState(() {
                        isOther = value!;
                        isOther
                            ? selectedGames.add("Other Game")
                            : selectedGames.remove("Other Game");
                      });
                    },
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Result Box
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),

              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                ),

                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  const Text(
                    "Selected Games",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    selectedGames.isEmpty
                        ? "No games selected"
                        : selectedGames.join(", "),

                    textAlign: TextAlign.center,

                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Checkbox Widget
  Widget buildCheckBox({
    required String title,
    required bool value,
    required IconData icon,
    required Color color,
    required Function(bool?) onChanged,
  }) {
    return CheckboxListTile(
      activeColor: color,

      value: value,

      onChanged: onChanged,

      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),

      secondary: Icon(icon, color: color),
    );
  }
}
