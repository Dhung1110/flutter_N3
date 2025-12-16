import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget menuButton(
    BuildContext context, {
    required String title,
    required String routeName,
    required IconData icon,
    Color? color,
  }) {
    final themeColor = color ?? Colors.blueAccent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: themeColor.withOpacity(0.15),
                child: Icon(icon, color: themeColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey.shade500),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // nền gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF37C6F7), Color(0xFF28C76F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar custom
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Main Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F4F7),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        menuButton(
                          context,
                          title: "BMI Calculator",
                          routeName: "/bmi",
                          icon: Icons.monitor_weight,
                          color: Colors.orange,
                        ),
                        menuButton(
                          context,
                          title: "Booking",
                          routeName: "/booking",
                          icon: Icons.event_available,
                          color: Colors.teal,
                        ),
                        menuButton(
                          context,
                          title: "Countdown Timer",
                          routeName: "/countdown",
                          icon: Icons.timer,
                          color: Colors.deepPurple,
                        ),
                        menuButton(
                          context,
                          title: "Feedback",
                          routeName: "/feedback",
                          icon: Icons.feedback_outlined,
                          color: Colors.pink,
                        ),
                        menuButton(
                          context,
                          title: "Login Form",
                          routeName: "/login-form",
                          icon: Icons.login,
                          color: Colors.indigo,
                        ),
                        menuButton(
                          context,
                          title: "Profile",
                          routeName: "/login-model",
                          icon: Icons.person_outline,
                          color: Colors.blueGrey,
                        ),
                        menuButton(
                          context,
                          title: "News List",
                          routeName: "/news",
                          icon: Icons.article_outlined,
                          color: Colors.blue,
                        ),
                        menuButton(
                          context,
                          title: "Product",
                          routeName: "/product",
                          icon: Icons.shopping_bag_outlined,
                          color: Colors.green,
                        ),
                        menuButton(
                          context,
                          title: "Register Form",
                          routeName: "/register",
                          icon: Icons.app_registration,
                          color: Colors.cyan,
                        ),
                        menuButton(
                          context,
                          title: "Home Screen",
                          routeName: "/homescreen",
                          icon: Icons.home_rounded,
                          color: const Color.fromARGB(255, 170, 224, 51),
                        ),
                        menuButton(
                          context,
                          title: "Home Page",
                          routeName: "/home",
                          icon: Icons.home_outlined,
                          color: Colors.brown,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
