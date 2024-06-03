import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../../global_providers.dart';
import '../../core/app/theme/colors.dart';
import '../../utils/image_picker/app_image_picker.dart';
import 'custom_dotted_container.dart';


class CustomImageGrid extends ConsumerStatefulWidget {
  const CustomImageGrid(
      {this.hintText = "Add photo", required this.providerId, this.length = 6,super.key});

  final String hintText;
  final int length;

  final String providerId;

  @override
  ConsumerState<CustomImageGrid> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends ConsumerState<CustomImageGrid> {

  final List<File> _pickedImages = [];
  Future<void> chooseImage({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.add(pickedFile);
      ref.read(pickedImageProvider(widget.providerId).notifier).setImages(_pickedImages);
      setState(() {});
    }
  }

  Future<void> chooseMultiImage({required int imageCount}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);


      ref.read(pickedImageProvider(widget.providerId).notifier).setImages(_pickedImages);
      setState(() {});
    }
  }

  @override
  void initState() {
    ref.read(pickedImageProvider(widget.providerId)).forEach((element) {
      _pickedImages.add(element);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
            labelText: widget.hintText != "Add photo"
                ? widget.hintText
                : '${widget.hintText} (${_pickedImages.length}/${widget.length})',
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: mediumBlue),
                borderRadius: BorderRadius.circular(15)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: mediumBlue),
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: grey,
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)
        ),
        child: ReorderableGridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 100.h,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1.0,
          onReorder: (oldImage, newImage) {
            setState(() {
              final reorderedImage = _pickedImages.removeAt(oldImage);
              _pickedImages.insert(newImage, reorderedImage);
              ref.read(pickedImageProvider(widget.providerId).notifier).setImages(_pickedImages);
            });
          },
          children: [
            for (final item in _pickedImages)
              SizedBox(
                key: ValueKey(item),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      top: 5.h,
                      child: InkWell(
                        onTap: () {
                          _pickedImages.remove(item);
                          ref.read(pickedImageProvider(widget.providerId).notifier).setImages(_pickedImages);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              border: Border.all(color: deepYellow),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.close,
                            color: Colors.brown,
                            size: MediaQuery.of(context).size.height * 0.019,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (_pickedImages.length <= (widget.length - 1))
              SizedBox(
                key: const ValueKey('AddImage'),
                child: InkWell(
                  onTap: _pickedImages.length == widget.length
                      ? null
                      : () async {
                    final isCamera = await ref
                        .read(mediaProvider)
                        .chooseSource(context);
                    if (isCamera != null) {
                      if (isCamera) {
                        chooseImage(isCamera: isCamera);
                        setState(() {});
                      } else {
                        final length =
                            widget.length - _pickedImages.length;
                        if (widget.length == 1) {
                          chooseImage(
                            isCamera: false,
                          );
                        } else {
                          chooseMultiImage(imageCount: length);
                        }
                        setState(() {});
                      }
                    }
                  },
                  child: const CustomDottedBox(
                      height: double.infinity,
                      child: Icon(
                        Icons.add,
                        color: mediumBlue,
                      )),
                ),
              ),
          ],
        ));
  }
}



