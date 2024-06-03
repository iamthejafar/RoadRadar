import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/app/theme/colors.dart';

final mediaProvider = Provider((ref) => MediaPicker());

class MediaPicker {
  Future<File?> captureMedia({
    ImageSource source = ImageSource.camera,
  }) async {
    final XFile? medias = await ImagePicker().pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 50);
    if (medias != null) {
      return File(medias.path);
    }
    return null;
  }

  Future<File?> captureVideo({
    ImageSource source = ImageSource.camera,
  }) async {
    final XFile? medias = await ImagePicker().pickVideo(
      source: source,
      preferredCameraDevice: CameraDevice.front,
    );
    if (medias != null) {
      return File(medias.path);
    }
    return null;
  }

  Future<File?> pickVideo() async {
    final XFile? video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      return File(video.path);
    }
    return null;
  }

  Future<File?> pickImage({
    int quality = 50,
  }) async {
    final data = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: quality);
    if (data != null) {
      return File(data.path);
    }
    return null;
  }

  Future<List<File>> pickMultiImage(
      {int quality = 50, int count = 10, required BuildContext context}) async {
    final List<File> images = [];

    final data = await ImagePicker().pickMultiImage(imageQuality: quality);

    if (data.length > count) {
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text("Cannot pick more than $count images"),
            ),
          ),
        );
      }
      return [];
    }

    for (final image in data) {
      images.add(File(image.path));
    }

    return images;
  }

  Future<bool?> chooseSource(BuildContext context) async {
    bool? isCamera;

    isCamera = await buildShowModalBottomSheet<bool>(
      context,
      (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            27.verticalSpace,
            Text(
              'Upload from',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            18.verticalSpace,
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    width: 217.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.camera_alt_outlined),
                        13.horizontalSpace,
                        Text('Camera', style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),
                  ),
                ),
                9.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    width: 217.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.image),
                        14.horizontalSpace,
                        Text('Gallery', style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      initialHeight: 0.24,
    );
    return isCamera;
  }

  Future<bool?> chooseSourceSeller(BuildContext context) async {
    bool? isCamera;

    isCamera = await buildShowModalBottomSheet<bool>(context, (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          27.verticalSpace,
          Text(
            'Upload from',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          18.verticalSpace,
          Column(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  context.popRoute(true);
                },
                borderRadius: BorderRadius.circular(11),
                child: Container(
                  width: 217.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.camera_alt_outlined),
                      13.horizontalSpace,
                      Text('Camera', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                ),
              ),
              9.verticalSpace,
              InkWell(
                onTap: () {
                  context.popRoute(false);
                },
                borderRadius: BorderRadius.circular(11),
                child: Container(
                  width: 217.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.image),
                      14.horizontalSpace,
                      Text('Gallery', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }, initialHeight: 0.24, useRootNavigator: false);
    return isCamera;
  }
}

Future<T?> buildShowModalBottomSheet<T>(
  BuildContext context,
  Widget Function(ScrollController controller) builder, {
  double initialHeight = 0.9,
  Color bottomsheetcolor = white,
  bool useRootNavigator = true,
}) {
  return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return makeDismissable(
          context: context,
          child: DraggableScrollableSheet(
              initialChildSize: initialHeight,
              maxChildSize: 0.9,
              minChildSize: 0.2,
              builder: (context, controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: bottomsheetcolor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Container(
                        height: 6.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffCECECE),
                            borderRadius: BorderRadius.circular(4.5.r)),
                      ),
                      Expanded(child: builder(controller))
                    ],
                  ),
                );
              }),
        );
      });
}

Widget makeDismissable(
        {required Widget child, required BuildContext context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: child,
    );
