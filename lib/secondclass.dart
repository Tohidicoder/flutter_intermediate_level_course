import 'package:flutter/material.dart';

class LPlaceholder extends StatelessWidget {
  const LPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF1F8),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Modern Placeholder UI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// 🔥 TOP CARD
              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff6A11CB), Color(0xff2575FC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.25),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    /// 👤 AVATAR
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,

                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                        size: 45,
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// TITLE
                    const Text(
                      "Profile Placeholder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Loading user profile...",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),

                    const SizedBox(height: 25),

                    /// BIG PLACEHOLDER
                    Container(
                      height: 150,
                      width: 150,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: const Placeholder(
                        color: Colors.deepPurple,
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// 📦 CONTENT CARD
              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: Colors.deepPurple,
                          size: 28,
                        ),

                        const SizedBox(width: 10),

                        const Text(
                          "Loading Content",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// LARGE PLACEHOLDER
                    Container(
                      height: 130,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        border: Border.all(color: Colors.blue, width: 2),
                      ),

                      child: const Placeholder(
                        color: Colors.blue,
                        strokeWidth: 2,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// SMALL PLACEHOLDERS TITLE
                    const Text(
                      "More Loading Widgets",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// SMALL PLACEHOLDERS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        buildSmallPlaceholder(
                          color: Colors.orange,
                          icon: Icons.image,
                        ),

                        buildSmallPlaceholder(
                          color: Colors.green,
                          icon: Icons.person,
                        ),

                        buildSmallPlaceholder(
                          color: Colors.red,
                          icon: Icons.shopping_cart,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 SMALL PLACEHOLDER WIDGET
  Widget buildSmallPlaceholder({required Color color, required IconData icon}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.15),

          child: Icon(icon, color: color),
        ),

        const SizedBox(height: 10),

        Container(
          height: 80,
          width: 80,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),

            border: Border.all(color: color, width: 2),
          ),

          child: Placeholder(color: color, strokeWidth: 2),
        ),
      ],
    );
  }
}
