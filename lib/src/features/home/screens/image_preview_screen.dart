import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';




@RoutePage()
class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key, required this.urls, required this.initialPage});
  final List<String> urls;
  final int initialPage;

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: blackColor,iconTheme: const IconThemeData(color: whiteColor),),
      backgroundColor: blackColor,
      body: PageView(
        children: [
          for(final url in widget.urls)
            Image.network(
              url,
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, loadingProgress){
                if(loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, obj, st){
                return const Icon(Icons.image_not_supported);
              },

            )

        ],
      ),
    );
  }
}
