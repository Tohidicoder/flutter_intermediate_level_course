import 'package:flutter/material.dart';

class LRadio extends StatefulWidget {
  const LRadio({super.key});

  @override
  State<LRadio> createState() => _LRadioState();
}

class _LRadioState extends State<LRadio> {
  String selectedGender = "Male";
  String selectedColor = "Blue";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        title: const Text("Modern Radio UI"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// Gender Card
            Container(
              padding: const EdgeInsets.all(16),

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.person, color: Colors.deepPurple),
                      SizedBox(width: 10),

                      Text(
                        "Select Gender",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  RadioListTile(
                    activeColor: Colors.deepPurple,
                    title: const Text("Male"),
                    value: "Male",
                    groupValue: selectedGender,

                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),

                  RadioListTile(
                    activeColor: Colors.deepPurple,
                    title: const Text("Female"),
                    value: "Female",
                    groupValue: selectedGender,

                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Favorite Color Card
            Container(
              padding: const EdgeInsets.all(16),

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.color_lens, color: Colors.deepPurple),

                      SizedBox(width: 10),

                      Text(
                        "Favorite Color",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  RadioListTile(
                    activeColor: Colors.blue,
                    title: const Text("Blue"),
                    value: "Blue",
                    groupValue: selectedColor,

                    onChanged: (value) {
                      setState(() {
                        selectedColor = value!;
                      });
                    },
                  ),

                  RadioListTile(
                    activeColor: Colors.red,
                    title: const Text("Red"),
                    value: "Red",
                    groupValue: selectedColor,

                    onChanged: (value) {
                      setState(() {
                        selectedColor = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Result Box
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
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
                    "Selected Values",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Gender: $selectedGender",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Color: $selectedColor",
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
}
