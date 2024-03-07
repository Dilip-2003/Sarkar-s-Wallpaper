import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/searchimages.dart';

class WallPaperCategory extends StatefulWidget {
  const WallPaperCategory({super.key});

  @override
  State<WallPaperCategory> createState() => _WallPaperCategoryState();
}

class _WallPaperCategoryState extends State<WallPaperCategory> {

    List<String> categoriesUrls = [
      'https://images.pexels.com/photos/2105416/pexels-photo-2105416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/561463/pexels-photo-561463.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/460775/pexels-photo-460775.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/60628/flower-garden-blue-sky-hokkaido-japan-60628.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1656059/pexels-photo-1656059.jpeg?auto=compress&cs=tinysrgb&w=600',
      
    ];
    List<String> titleList = [
      'Nature',
      'Car',
      'Sea',
      'Animals',
      'Flowers',
      'Art',
      
    ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: categoriesUrls.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return  InkWell(
          onTap: () {
            
             Navigator.push(context, MaterialPageRoute(builder: (context) {
               return SearchImages(title: titleList[index],);
             },));
          },
          child: Stack(
              children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(categoriesUrls[index],height: 60,width: 120,fit: BoxFit.cover,)),
                    ),
                    Positioned(
                      top: 15,
                      left: 40,
                      child: Text(titleList[index],style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,),)),
              ],
            ),
        );
       
      
      },),
    );
  }
}