import 'package:flutter/material.dart';
import '../Profile/Login_page.dart'; // đổi lại đúng thư mục + tên file

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Map<String, dynamic> user = const {
    "firstName": "Emily",
    "lastName": "Johnson",
    "email": "emily.johnson@x.dummyjson.com",
    "phone": "+81 965-431-3024",
    "age": 29,
    "gender": "female",
    "bloodGroup": "O-",
    "address": {
      "address": "626 Main Street",
      "city": "Phoenix",
      "country": "United States"
    },
    "company": {
      "name": "Dooley, Kozey and Cronin",
      "title": "Sales Manager"
    },
    "university": "University of Wisconsin--Madison"
  };

  @override
  Widget build(BuildContext context) {
    final fullName = "${user['firstName']} ${user['lastName']}";

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
  IconButton(
    icon: const Icon(Icons.logout),
    onPressed: () {
      // Push trực tiếp LoginPage (KHÔNG dùng named route)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    },
  )
],

      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(flex: 4, child: _leftPanel()),
              const SizedBox(width: 16),
              Expanded(flex: 6, child: _rightPanel(fullName)),
            ],
          ),
        ),
      ),
    );
  }

  // ================= LEFT =================
  Widget _leftPanel() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2F3338),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child:
                  Icon(Icons.person, size: 60, color: Colors.grey.shade700),
            ),
          ),
          const SizedBox(height: 24),

          _leftTitle("ABOUT ME"),
          const Text(
            "Sales manager with strong communication skills and passion for technology products.",
            style: TextStyle(color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 24),
          _leftTitle("PERSONAL DETAILS"),
          _infoRow("Age", "${user['age']}"),
          _infoRow("Gender", user['gender']),
          _infoRow("Blood group", user['bloodGroup']),
          _infoRow("Phone", user['phone']),

          const SizedBox(height: 24),
          _leftTitle("LANGUAGES"),
          _language("English", 0.9),
          _language("Japanese", 0.7),
        ],
      ),
    );
  }

  // ================= RIGHT =================
  Widget _rightPanel(String fullName) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName.toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              user['company']['title'],
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),
            _iconLine(
              Icons.location_on_outlined,
              "${user['address']['address']}, "
              "${user['address']['city']}, "
              "${user['address']['country']}",
            ),
            _iconLine(Icons.phone_android, user['phone']),
            _iconLine(Icons.email_outlined, user['email']),

            const SizedBox(height: 32),
            _sectionTitle("WORK EXPERIENCE"),
            _timeline(
              company: user['company']['name'],
              location: user['address']['city'],
              period: "2018 - Present",
              title: user['company']['title'],
              description:
                  "Leading sales team, managing key accounts and driving revenue growth.",
            ),
            const SizedBox(height: 20),
            _timeline(
              company: "Previous Company",
              location: "Tokyo",
              period: "2015 - 2018",
              title: "Account Executive",
              description:
                  "Developed client relationships and supported regional sales campaigns.",
            ),

            const SizedBox(height: 32),
            _sectionTitle("EDUCATION"),
            _timeline(
              company: user['university'],
              location: "Wisconsin",
              period: "2010 - 2014",
              title: "BBA, Marketing",
              description: "",
            ),
          ],
        ),
      ),
    );
  }

  // ================= WIDGET HELPERS =================
  Widget _leftTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
          ),
        ),
      );

  Widget _infoRow(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Expanded(
              child: Text(label,
                  style: const TextStyle(color: Colors.white70)),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _language(String name, double value) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 6,
                backgroundColor: Colors.white24,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        ),
      );

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
          ),
        ),
      );

  Widget _iconLine(IconData icon, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      );

  Widget _timeline({
    required String company,
    required String location,
    required String period,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 60,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                "$location  •  $period",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              if (description.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}
