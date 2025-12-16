import 'package:flutter/material.dart';

// INTRO + DRAWER
import 'Menu/home_intro.dart';

// MENU (nếu vẫn muốn giữ)
import 'Menu/menu_page.dart';

// HOME
import 'myhomepage.dart';

// MODEL PROFILE
import 'Profile/Login_page.dart';
import 'Profile/profile_page.dart';

// NEWS
import 'News/news_list.dart';

// PRODUCT
import 'Product/MyProduct.dart';

// OTHER
import 'BMICalculator.dart';
import 'Booking.dart';
import 'countdown_timer_page.dart';
import 'FeedbackForm.dart';
import 'RegisterFrom.dart';
import 'LoginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key); // bỏ const cho chắc chắn

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // mở app vào intro
      initialRoute: '/intro',

      routes: {
        '/intro': (context) => HomeIntroPage(),

        // menu cũ
        '/menu': (context) => const MenuPage(),

        '/home': (context) => const MyHomePage(),

        '/login-model': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),

        '/news': (context) => const NewsListScreen(),
        '/product': (context) => const MyProduct(),

        '/bmi': (context) => BMICalculator(),
        '/booking': (context) => BookingListPage(),
        '/countdown': (context) => CountdownTimerPage(),
        '/feedback': (context) => FeedbackForm(),
        '/register': (context) => RegisterForm(),
        '/login-form': (context) => LoginForm(),
      },
    );
  }
}
