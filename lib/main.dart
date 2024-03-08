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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        
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


      body:   Column(
        children: [ 
          const WallPaperSearch(),
          const WallPaperCategory(),
          Container(
          padding:  const EdgeInsets.all(10),
          child:const Center(child: Text('Trending Images',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
        ),
          const Flexible(child: TrendingImages()),

        ],
      ),

      
    );
  }
}

