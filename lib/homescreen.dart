import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          width: 350,
          height: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar với icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 28),
                    Row(
                      children: [
                        Icon(Icons.notifications_none, size: 28),
                        SizedBox(width: 10),
                        Icon(Icons.person_outline, size: 28),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),
                // Welcome
                Text(
                  "Welcome,",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Charlie",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 24),
                // Search box
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Saved Places label
                Text(
                  "Saved Places",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                SizedBox(height: 12),
                // 4 ảnh địa điểm
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                     buildPlaceImage('assets/images/Picture1.png'),
                     buildPlaceImage('assets/images/Picture3.png'),
                     buildPlaceImage('assets/images/Picture4.png'),
                     buildPlaceImage('assets/images/Picture5.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget buildPlaceImage(String path) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.asset(
      path,
      fit: BoxFit.cover,
    ),
  );
}
}
