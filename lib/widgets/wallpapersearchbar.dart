import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/searchimages.dart';

class WallPaperSearch extends StatefulWidget {
 const WallPaperSearch({super.key});

  @override
  State<WallPaperSearch> createState() => _WallPaperSearchState();
}

class _WallPaperSearchState extends State<WallPaperSearch> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration( 
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [ 
         Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Search Wallpapers',
                  border: InputBorder.none
                ),
              ),
            ),
     

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              
              return SearchImages(title: textController.text.toString());
            },));
          }, icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}