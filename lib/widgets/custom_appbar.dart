import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        Text("Sarkar's " ,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.blueGrey,
        ),),
        Text('Wallpaper',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.blueAccent,
        ),)
      ],
    );
  }
}