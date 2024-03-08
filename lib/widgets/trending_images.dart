
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/fullscreen.dart';

class TrendingImages extends StatefulWidget {
  const TrendingImages({super.key});

  @override
  State<TrendingImages> createState() => _TrendingImagesState();
}

class _TrendingImagesState extends State<TrendingImages> {
  List images = [];
  int page = 1;

  getApi() async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),headers: {
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

    String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';

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
    return TrendingImagesWidgets(images: images,loadMore: loadmore,);
  }
}



// ignore: must_be_immutable
class TrendingImagesWidgets extends StatefulWidget {
  TrendingImagesWidgets({super.key,required this.images,required this.loadMore});

  final List images;
  VoidCallback loadMore;
  bool isLoading = false;
  @override
  State<TrendingImagesWidgets> createState() => _TrendingImagesWidgetsState();
}

class _TrendingImagesWidgetsState extends State<TrendingImagesWidgets> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child:const Center(child: Text('Trending Images',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FullScreen(imageUrl: widget.images[index]['src']['original'],);
                  },));
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.images[index]['src']['large'],fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
        InkWell(
          onTap: () {
            print('loaded successfully');
            widget.loadMore();
          },
          child: Container(
            height: 60,
            width: double.infinity,
            color: Colors.grey.shade100,
            child: const Center(
              child: Text('Load More', style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ],
    );
  }
}