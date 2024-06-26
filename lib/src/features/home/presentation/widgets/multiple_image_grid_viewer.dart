
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadradar/src/comman/models/image_model.dart';

import '../../../../core/app/theme/colors.dart';
import '../../../../core/app/router/router.gr.dart';



class MultipleImageGridViewer extends ConsumerWidget {
  const MultipleImageGridViewer({Key? key, required this.images})
      : super(key: key);

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width - 80;

    return images.isEmpty ? const SizedBox(): Container(
      width: width,
      height: images.length == 1 ? width * 0.6 : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.router.push(ImagePreviewRoute(
                                images: images, initialPage: 0));
                          },
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: images[0].url,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.error),
                                Text('Unable to Load Image')
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (images.length == 2 || images.length > 4)
                        Container(
                          width: 1,
                          color: white,
                        ),
                      if (images.length == 2 || images.length > 4)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context.router.push(ImagePreviewRoute(
                                  images: images, initialPage: 1));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images[1].url,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (images.length > 2)
                  Container(
                    width: 1,
                    color: white,
                  ),
                if (images.length > 2)
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context.router.push(ImagePreviewRoute(
                                  images: images, initialPage: 2));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images.length == 4 || images.length == 3
                                        ? images[1].url
                                        : images[2].url,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (images.length > 2)
                          Container(
                            width: 1,
                            height: 2,
                            color: white,
                          ),
                        if (images.length > 2)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.router.push(ImagePreviewRoute(
                                    images: images, initialPage: 2));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      images.length == 4 || images.length == 3
                                          ? images[2].url
                                          : images[3].url,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (images.length > 3)
                          Container(
                            width: 1,
                            color: white,
                          ),
                        if (images.length > 3)
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        images.length == 4
                                            ? images[3].url
                                            : images[4].url,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (images.length > 5)
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: black,
                                    ),
                                    child: Center(
                                        child: Text(
                                          "+${images.length - 5}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: white,
                                          ),
                                        )),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
