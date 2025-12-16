import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BookingListPage()));
}

class BookingListPage extends StatelessWidget {
  final List<Map<String, dynamic>> places = [
    {
      'label': 'Bao bữa sáng',
      'image': 'assets/images/image1.webp', 
      'name': 'aNhill Boutique',
      'rating': 9.5,
      'ratingLabel': 'Xuất sắc',
      'reviews': 95,
      'location': 'Huế',
      'distance': 0.6,
      'roomInfo': '1 suite riêng tư · 1 giường',
      'price': 109,
    },
    {
      'label': 'Bao bữa sáng',
      'image': 'assets/images/image2.webp',
      'name': 'An Nam Hue Boutique',
      'rating': 9.2,
      'ratingLabel': 'Tuyệt hảo',
      'reviews': 34,
      'location': 'Cự Chinh',
      'distance': 0.9,
      'roomInfo': '1 phòng khách sạn · 1 giường',
      'price': 20,
    },
    {
      'label': '',
      'image': 'assets/images/image3.jpg',
      'name': 'Huế Jade Hill Villa',
      'rating': 8.0,
      'ratingLabel': 'Rất tốt',
      'reviews': 1,
      'location': 'Cự Chinh',
      'distance': 1.3,
      'roomInfo':
          '1 biệt thự nguyên căn - 1.000 m²: 4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm',
      'price': 285,
      'note': 'Chỉ còn 1 căn với giá này trên Booking.com\nKhông cần thanh toán trước',
      'noteColor': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1444a3),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.black87),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Xung quanh vị trí hiện tại',
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '23 thg 10 - 24 thg 10',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _MenuButton(Icons.sort, 'Sắp xếp'),
                  _MenuButton(Icons.filter_alt_outlined, 'Lọc'),
                  _MenuButton(Icons.map_outlined, 'Bản đồ'),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '757 chỗ nghỉ',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  itemCount: places.length,
                  separatorBuilder: (_, __) => Divider(height: 24),
                  itemBuilder: (_, index) {
                    final place = places[index];
                    return _PlaceItem(place: place);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MenuButton(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}

class _PlaceItem extends StatelessWidget {
  final Map<String, dynamic> place;

  const _PlaceItem({required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image with label
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                place['image'],
                width: 100,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            if ((place['label'] ?? '').trim().isNotEmpty)
              Positioned(
                top: 4,
                left: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    place['label'],
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
          ],
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place['name'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '${place['rating']}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(width: 6),
                  Text('${place['ratingLabel']} · ${place['reviews']} đánh giá'),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('${place['location']} · Cách bạn ${place['distance']} km'),
                ],
              ),
              SizedBox(height: 6),
              Text(
                place['roomInfo'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('US\$${place['price']}'),
              if (place.containsKey('note'))
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    place['note'],
                    style: TextStyle(
                      color: place['noteColor'] ?? Colors.black,
                      fontSize: 12,
                    ),
                  ),
                )
            ],
          ),
        ),
        Icon(Icons.favorite_border),
      ],
    );
  }
}
