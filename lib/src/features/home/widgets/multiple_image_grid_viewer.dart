
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traffic_safety/src/constants/colors.dart';

import '../../../app/router/router.gr.dart';



class MultipleImageGridViewer extends ConsumerWidget {
  const MultipleImageGridViewer({Key? key, required this.images})
      : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width - 80;

    return images.isEmpty ? SizedBox(): Container(
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
                                urls: images, initialPage: 0));
                          },
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: images[0],
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
                          color: whiteColor,
                        ),
                      if (images.length == 2 || images.length > 4)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context.router.push(ImagePreviewRoute(
                                  urls: images, initialPage: 1));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images[1],
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
                    color: whiteColor,
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
                                  urls: images, initialPage: 2));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images.length == 4 || images.length == 3
                                        ? images[1]
                                        : images[2],
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
                            color: whiteColor,
                          ),
                        if (images.length > 2)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.router.push(ImagePreviewRoute(
                                    urls: images, initialPage: 2));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      images.length == 4 || images.length == 3
                                          ? images[2]
                                          : images[3],
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
                            color: whiteColor,
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
                                            ? images[3]
                                            : images[4],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (images.length > 5)
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: blackColor,
                                    ),
                                    child: Center(
                                        child: Text(
                                          "+${images.length - 5}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: whiteColor,
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
