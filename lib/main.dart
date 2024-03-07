import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/categorieslist.dart';
import 'package:wallpaper/widgets/custom_appbar.dart';
import 'package:wallpaper/widgets/trending_images.dart';
import 'package:wallpaper/widgets/wallpapersearchbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallPaper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WallPaperHomePage(),
    );
  }
}

class WallPaperHomePage extends StatelessWidget {
   const WallPaperHomePage({super.key}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // centerTitle: true,
        title: const CustomAppBar(),
      ),


      body:  const Column(
        children: [ 
          WallPaperSearch(),
          WallPaperCategory(),
          // SizedBox(height: 20,),
          Flexible(child: TrendingImages()),

        ],
      ),

      
    );
  }
}

