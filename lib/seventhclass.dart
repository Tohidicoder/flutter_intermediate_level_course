import 'package:flutter/material.dart';

class LAbsorbPointer extends StatefulWidget {
  const LAbsorbPointer({super.key});

  @override
  State<LAbsorbPointer> createState() => _LAbsorbPointerState();
}

class _LAbsorbPointerState extends State<LAbsorbPointer> {
  String txtString = "Touch above container";

  bool isAbsorbing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        title: const Text("AbsorbPointer Demo"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Column(
        children: [
          /// TOP INFO CARD
          Padding(
            padding: const EdgeInsets.all(16),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                ),

                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Row(
                children: const [
                  Icon(Icons.touch_app, color: Colors.white, size: 30),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      "Tap the containers to test AbsorbPointer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// SWITCH
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: SwitchListTile(
                activeColor: Colors.deepPurple,

                title: const Text(
                  "Enable AbsorbPointer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                value: isAbsorbing,

                onChanged: (value) {
                  setState(() {
                    isAbsorbing = value;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// MAIN AREA
          Expanded(
            child: Stack(
              alignment: Alignment.center,

              children: [
                /// BACKGROUND CONTAINER
                InkWell(
                  onTap: () {
                    setState(() {
                      txtString = "You touched the pink container";
                    });
                  },

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),

                    margin: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.pink, Colors.deepOrange],
                      ),

                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),

                /// YELLOW BOX
                AbsorbPointer(
                  absorbing: isAbsorbing,

                  child: InkWell(
                    onTap: () {
                      setState(() {
                        txtString = "You touched yellow container";
                      });
                    },

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),

                      width: MediaQuery.of(context).size.width / 1.8,

                      height: MediaQuery.of(context).size.height / 3.5,

                      decoration: BoxDecoration(
                        color: Colors.yellow,

                        borderRadius: BorderRadius.circular(25),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              isAbsorbing ? Icons.block : Icons.touch_app,

                              size: 50,

                              color: Colors.deepPurple,
                            ),

                            const SizedBox(height: 15),

                            Text(
                              isAbsorbing ? "Touch Disabled" : "Touch Enabled",

                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM MESSAGE
          Padding(
            padding: const EdgeInsets.all(20),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),

              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.deepPurple,

                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Text(
                txtString,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
