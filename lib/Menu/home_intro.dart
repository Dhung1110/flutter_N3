import 'package:flutter/material.dart';

class HomeIntroPage extends StatelessWidget {
  HomeIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer chứa menu bài tập
      drawer: const _AppDrawer(),
      
      // AppBar với hamburger icon tự động mở drawer
      appBar: AppBar(
        title: const Text(
          "Giới thiệu",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(0, 249, 252, 250),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF37C6F7), Color(0xFF28C76F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF37C6F7), Color(0xFF28C76F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar 
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Họ tên
                const Text(
                  'Nguyễn Đăng Hưng',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Mã SV
                const Text(
                  'Mã SV: 22T1020146',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Trường Đại học
                _infoCard(
                  icon: Icons.school,
                  title: 'Trường Đại học Khoa Học - Huế',
                ),
                const SizedBox(height: 12),
                
                // Ngành học
                _infoCard(
                  icon: Icons.code,
                  title: 'Công nghệ Thông tin',
                ),
                const SizedBox(height: 12),
                
                // Học phần - Nhóm 3
                _infoCard(
                  icon: Icons.phone_android,
                  title: 'Lập trình ứng dụng cho các thiết bị di động • Nhóm 3',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoCard({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

/// Drawer chứa danh sách bài tập 
class _AppDrawer extends StatelessWidget {
  const _AppDrawer({Key? key}) : super(key: key);

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
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, routeName);
        },
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
    return Drawer(
      child: Container(
        color: const Color(0xFFF2F4F7),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Bài tập',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(thickness: 2),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      menuButton(context, title: "BMI Calculator", routeName: "/bmi", icon: Icons.monitor_weight, color: Colors.orange),
                      menuButton(context, title: "Booking", routeName: "/booking", icon: Icons.event_available, color: Colors.teal),
                      menuButton(context, title: "Countdown Timer", routeName: "/countdown", icon: Icons.timer, color: Colors.deepPurple),
                      menuButton(context, title: "Feedback", routeName: "/feedback", icon: Icons.feedback_outlined, color: Colors.pink),
                      menuButton(context, title: "Login Form", routeName: "/login-form", icon: Icons.login, color: Colors.indigo),
                      menuButton(context, title: "Profile", routeName: "/login-model", icon: Icons.person_outline, color: Colors.blueGrey),
                      menuButton(context, title: "News List", routeName: "/news", icon: Icons.article_outlined, color: Colors.blue),
                      menuButton(context, title: "Product", routeName: "/product", icon: Icons.shopping_bag_outlined, color: Colors.green),
                      menuButton(context, title: "Register Form", routeName: "/register", icon: Icons.app_registration, color: Colors.cyan),
                      menuButton(context, title: "Home Page", routeName: "/home", icon: Icons.home_outlined, color: Colors.brown),
                      const SizedBox(height: 20),
                    ],
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
