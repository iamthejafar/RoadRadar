import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:roadradar/src/comman/models/image_model.dart';

import '../../../../core/app/theme/colors.dart';






@RoutePage()
class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key, required this.images, required this.initialPage});
  final List<ImageModel> images;
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
      appBar: AppBar(backgroundColor: black,iconTheme: const IconThemeData(color: white),),
      backgroundColor: black,
      body: PageView(
        children: [
          for(final item in widget.images)
            Image.network(
              item.url,
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
