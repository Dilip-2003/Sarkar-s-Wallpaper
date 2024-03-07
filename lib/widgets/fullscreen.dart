import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key,required this.imageUrl});

  final String imageUrl ;
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
 bool isLoading = false;
 Future<void> setWallPaper() async {
  try {
    setState(() {
      isLoading = true;
    });

    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    // Handle success
    if (result) {
      print('Wallpaper set successfully');
      setState(() {
        isLoading = false;
      });
    } else {
      print('Failed to set wallpaper');
      setState(() {
        isLoading = false;
      });
    }
  } catch (e) {
    // Handle error
    
    print('Failed to set wallpaper: $e');
    setState(() {
      isLoading = false;
    });
  }
}
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [ 
          Expanded(child: Image.network(widget.imageUrl,fit: BoxFit.cover,)),
      
          InkWell(
        onTap: () {
          setWallPaper();
        },
        child: Stack(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text('Set WallPaper', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),

             
            ),

          isLoading?  const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),):const SizedBox(),
          ],
        ),
      ),
        ],
      ),
    );
  }
}