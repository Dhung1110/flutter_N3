import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }
}
Widget myBody(){
  return Column(
    
    children: [
      Center(
        child: Text("Xin chào mọi người!",
       style: TextStyle(color: Colors.blue, fontSize: 20),
       ),
      ),
      Icon(Icons.heart_broken, size: 200, color: Colors.red),
      Text("Lập trình di động - Nhóm 3",
      style:TextStyle(fontSize: 30, color: Colors.amber)),
    ],
  );
  
}