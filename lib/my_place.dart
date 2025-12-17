import 'package:flutter/material.dart';

void main() => runApp(MyPlaceApp());

class MyPlaceApp extends StatelessWidget {
  const MyPlaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPlace(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPlace extends StatelessWidget {
  MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('My Place'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            block1(), // Ảnh to hơn
            block2(), // Gọn hơn
            block3(),
            block4(),
          ],
        ),
      ),
    );
  }

  Widget block1() {
    return Container(
      height: 500, 
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          'https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              height: 320, 
              color: Colors.grey[200],
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget block2() {
    // ✅ GỌN LẠI - Padding ít hơn + Typography nhỏ hơn
    return Padding(
      padding: const EdgeInsets.all(16), // 24 → 16
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Sa mạc Sahara', 
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2), 
              Text(
                'Châu Phi',
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(13), 
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.red, size: 18), 
                SizedBox(width: 4),
                Text(
                  '41',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15, // 16 → 15
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // block3() và block4() giữ nguyên
  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _actionButton(Icons.call, 'Gọi', Colors.blue),
          _actionButton(Icons.near_me, 'Chỉ đường', Colors.green),
          _actionButton(Icons.share, 'Chia sẻ', Colors.purple),
        ],
      ),
    );
  }

  Widget block4() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Text(
        'Sa mạc Sahara là sa mạc nóng lớn nhất thế giới, nằm ở Bắc Phi, trải dài qua hơn 10 quốc gia như Ai Cập, Algeria, Libya, Ma-rốc, Sudan… với diện tích khoảng 9,2 triệu km². Nơi đây nổi tiếng với những cồn cát khổng lồ, khí hậu khô hạn khắc nghiệt, nhiệt độ ban ngày có thể vượt 50°C, còn ban đêm lại lạnh sâu. Tuy vậy, Sahara không chỉ toàn cát mà còn có núi đá, ốc đảo và là nơi sinh sống của nhiều loài động vật thích nghi với môi trường khắc nghiệt. Sa mạc Sahara vừa mang vẻ đẹp hùng vĩ, vừa là một trong những môi trường khắc nghiệt nhất hành tinh.',
        style: TextStyle(
          fontSize: 15,
          height: 1.6,
          color: Colors.black87,
          letterSpacing: 0.3,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
