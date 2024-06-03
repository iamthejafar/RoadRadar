

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadradar/src/constants/buttons/app_button.dart';
import 'package:roadradar/src/core/app/theme/colors.dart';

import '../../../../comman/widgets/custom_image_grid.dart';
import '../../../../constants/textfield/app_text_field.dart';
import '../../../../utils/text_validation/text_validation.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost>
    with TickerProviderStateMixin {
  final descriptionController = TextEditingController();

  Future<List<String>> _uploadImages(List<File> selectedImages) async {
    List<String> url = [];

    for (var image in selectedImages) {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = FirebaseStorage.instance.ref().child('images/$imageName.jpg');

      await ref.putFile(File(image.path));

      String downloadURL = await ref.getDownloadURL();

      url.add(downloadURL);
    }
    return url;
  }

  final isTrending = true;
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "Create ${tabController.index == 0 ? "Post" : "Event"}",
            style: textTheme.displayLarge,
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 55),
            child: TabBar(
              onTap: (value) => setState(() => {}),
              controller: tabController,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: [
                Container(
                  height: 40.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: tabController.index == 0 ? deepBlue : mediumYellow,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Post",
                    style: tabController.index == 0
                        ? textTheme.bodyMedium!.copyWith(color: white)
                        : textTheme.bodyMedium!.copyWith(
                            color: deepBlue, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  height: 40.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: tabController.index == 1 ? deepBlue : mediumYellow,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Event",
                    style: tabController.index == 1
                        ? textTheme.bodyMedium!.copyWith(color: white)
                        : textTheme.bodyMedium!.copyWith(
                            color: deepBlue, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: tabController,
            children: [
              Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      children: [
                        5.verticalSpace,
                        Text(
                          'Add Description',
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          hintText: "Add Description",
                          maxlines: 3,
                          controller: descriptionController,
                          validator: (value) => Validate.empty(value!),
                        ),
                        20.verticalSpace,
                        const CustomImageGrid(providerId: "issueImage"),
                        20.verticalSpace,
                        
                        AppButton(text: "Submit", onTap: (){},)
                      ],
                    ),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      children: [
                        5.verticalSpace,
                        Text(
                          'Add Description',
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          hintText: "Add Description",
                          maxlines: 3,
                          controller: descriptionController,
                          validator: (value) => Validate.empty(value!),
                        ),
                        20.verticalSpace,
                        const CustomImageGrid(providerId: "issueImage"),
                        20.verticalSpace,

                        AppButton(text: "Submit", onTap: (){},)
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}



// import 'package:auto_route/auto_route.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'dart:io';
//
// import '../../../../comman/widgets/custom_image_grid.dart';
// import '../../../../core/app/theme/colors.dart';
// import '../../../../constants/textfield/app_text_field.dart';
// import '../../../../comman/widgets/custom_drop_down.dart';
// import '../../../../utils/text_validation/text_validation.dart';
//
//
// @RoutePage()
// class AddHazardIssueScreen extends ConsumerStatefulWidget {
//   const AddHazardIssueScreen({super.key});
//
//   @override
//   ConsumerState<AddHazardIssueScreen> createState() => _AddIssueScreenState();
// }
//
// class _AddIssueScreenState extends ConsumerState<AddHazardIssueScreen> {
//   final descriptionController = TextEditingController();
//
//   Future<List<String>> _uploadImages(List<File> selectedImages) async {
//     List<String> url = [];
//
//     for (var image in selectedImages) {
//       String imageName = DateTime.now().millisecondsSinceEpoch.toString();
//       final ref = FirebaseStorage.instance.ref().child('images/$imageName.jpg');
//
//       await ref.putFile(File(image.path));
//
//       String downloadURL = await ref.getDownloadURL();
//
//       url.add(downloadURL);
//     }
//     return url;
//   }
//
//   List<String> roadSafetyHazards = [
//     "Potholes",
//     "Fallen Poles",
//     "Fallen Trees",
//     "Road Blocks",
//     "Debris on the Road",
//     "Poor Visibility",
//     "Malfunctioning Traffic Signals",
//     "Inadequate Signage",
//     "Poor Road Markings",
//     "Waterlogging and Flooding",
//     "Unmaintained Infrastructure",
//     "Wildlife Crossings",
//     "Pedestrian Crosswalk Issues",
//     "Lack of Emergency Services Access",
//   ];
//
//   final formKey = GlobalKey<FormState>();
//
//   String? selectedIncident;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2, child:  Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Event'),
//         bottom: PreferredSize(preferredSize: Size(double.infinity, 1000), child: TabBar(tabs: [Text("Event"), Text("Post")],)),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               // 20.verticalSpace,
//               // Text(
//               //   'Select Hazard Type',
//               //   style: TextStyle(
//               //       color: black,
//               //       fontWeight: FontWeight.w500,
//               //       fontSize: 14.sp),
//               // ),
//               // 10.verticalSpace,
//               // CustomDropDownButton(
//               //   items: roadSafetyHazards,
//               //   hintText: "Select Hazard Type",
//               //   selectedItem: selectedIncident,
//               //   onChanged: (value) {
//               //     setState(() {
//               //       selectedIncident = value;
//               //     });
//               //   },
//               // ),
//               20.verticalSpace,
//               Text(
//                 'Add Description',
//                 style: TextStyle(
//                     color: black,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14.sp),
//               ),
//               10.verticalSpace,
//               AppTextField(
//                 hintText: "Add Description",
//                 maxlines: 3,
//                 controller: descriptionController,
//                 validator: (value) => Validate.empty(value!),
//               ),
//               20.verticalSpace,
//               const CustomImageGrid(providerId: "issueImage"),
//               20.verticalSpace,
//               // AppButton(
//               //   text: "Submit",
//               //   onTap: () async {
//               //     final files = ref.read(pickedImageProvider('issueImage'));
//               //
//               //     if (selectedIncident != null &&
//               //         formKey.currentState!.validate()) {
//               //       if (files.isNotEmpty) {
//               //           showLoading(context);
//               //
//               //           Position? location;
//               //           try{
//               //             debugPrint('Getting Location');
//               //             location = await LocationService().getLocation();
//               //             debugPrint('Location : $location');
//               //           } catch(e){
//               //             if(context.mounted){
//               //               ScaffoldMessenger.of(context).showSnackBar(
//               //                 SnackBar(content: Text(e.toString()),),);
//               //             }
//               //           }
//               //         if (location != null) {
//               //           final url = await _uploadImages(files);
//               //           // HazardIssueModel model = HazardIssueModel(
//               //           //   hazardType: selectedIncident!,
//               //           //   coordinates: [location.latitude, location.longitude],
//               //           //   uid: UserPreferences.userId,
//               //           //   description: descriptionController.text.trim(),
//               //           //   images: url,
//               //           // );
//               //
//               //         try{
//               //           await FirebaseFirestore.instance
//               //               .collection("issues")
//               //               .add(model.toJson());
//               //           if (context.mounted) {
//               //             successDialog(
//               //               context,
//               //               onPressed: () {
//               //                 Navigator.of(context).pop();
//               //                 Navigator.of(context).pop();
//               //                 ref.read(pickedImageProvider('issueImage').notifier).dispose();
//               //                 context.router.pop();
//               //               },
//               //             );
//               //           }
//               //
//               //         } catch (e){
//               //           if (context.mounted) {
//               //             failedDialog(
//               //               context,
//               //               onPressed: () {
//               //                 Navigator.of(context).pop();
//               //                 Navigator.of(context).pop();
//               //                 ref.read(pickedImageProvider('issueImage').notifier).dispose();
//               //                 context.router.pop();
//               //               },
//               //             );
//               //           }
//               //
//               //         }
//               //
//               //
//               //         } else {
//               //           if (context.mounted) {
//               //             ScaffoldMessenger.of(context)
//               //                 .showSnackBar(const SnackBar(
//               //               backgroundColor: Colors.red,
//               //               content: Text('Unable to Fetch Location.'),
//               //             ));
//               //           }
//               //         }
//               //       } else {
//               //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               //           backgroundColor: darkGrey,
//               //           content: Text('Please Add Images.'),
//               //         ));
//               //       }
//               //     } else {
//               //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               //         backgroundColor: darkGrey,
//               //         content: Text('Please select hazard type.'),
//               //       ));
//               //     }
//               //   },
//               // )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }