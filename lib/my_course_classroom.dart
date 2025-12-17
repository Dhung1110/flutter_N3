import 'package:flutter/material.dart';

void main() => runApp(MyCoursesApp());

class MyCoursesApp extends StatelessWidget {
  const MyCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCourses(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCourses extends StatelessWidget {
  MyCourses({super.key}); // ✅ Bỏ const

  final List<Map<String, dynamic>> courses = [ // ✅ Không final const
    {
      'title': 'XML và ứng dụng - Nhóm 1',
      'code': '2025-2026.1.TIN4583.001',
      'students': '58 học viên',
      'color': Colors.blueGrey
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 6',
      'code': '2025-2026.1.TIN4403.006',
      'students': '55 học viên',
      'color': Colors.deepOrange
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 5',
      'code': '2025-2026.1.TIN4403.005',
      'students': '52 học viên',
      'color': Colors.orange
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 4',
      'code': '2025-2026.1.TIN4403.004',
      'students': '50 học viên',
      'color': Colors.blue
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Lớp học phần của tôi"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return courseCard(
            course['title'],
            course['code'],
            course['students'],
            course['color'],
          );
        },
      ),
    );
  }

  Widget courseCard(String title, String code, String students, Color bgColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                itemBuilder: (context) => const [
                  PopupMenuItem(child: Text('Chỉnh sửa')),
                  PopupMenuItem(child: Text('Xóa lớp')),
                  PopupMenuItem(child: Text('Thông tin chi tiết')),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            code,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.people_outline, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(
                students,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
