import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/trending_images.dart';

class SearchImages extends StatefulWidget {
   const SearchImages({super.key, required this.title});

  final String title;
  @override
  State<SearchImages> createState() => _SearchImagesState();
}

class _SearchImagesState extends State<SearchImages> {

    List images = [];
    int page = 1;

  getApi() async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=${widget.title}&per_page=80'),headers: {
      'Authorization':'kTbuEOQNQvMGsMXuW57xsQi0XYr7CZ1GuqfL3aMPQTP7hPrE7bTwWjvX'
    }).then((jsonData){
      Map jsonDataValue = jsonDecode(jsonData.body);

      setState(() {
        images = jsonDataValue['photos'];

      });
    });
  }

  loadmore() async{
    setState(() {
      page=page+1;
    });

    String url = 'https://api.pexels.com/v1/search?query=${widget.title}&per_page=80&page=$page';

     await http.get(Uri.parse(url),headers: {
      'Authorization':'kTbuEOQNQvMGsMXuW57xsQi0XYr7CZ1GuqfL3aMPQTP7hPrE7bTwWjvX'
    }).then((jsonData){
      Map jsonDataValue = jsonDecode(jsonData.body);

      setState(() {
        images.addAll(jsonDataValue['photos']);
      });
    });
}
  @override
  void initState() {
    
    super.initState();
    getApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('${widget.title} Images')),
      ),
      body: TrendingImagesWidgets(images: images, loadMore: loadmore, ));
  }
}