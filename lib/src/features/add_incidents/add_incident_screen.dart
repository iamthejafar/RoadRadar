import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traffic_safety/global_providers.dart';
import 'package:traffic_safety/src/constants/buttons/app_button.dart';
import 'package:traffic_safety/src/constants/colors.dart';
import 'package:traffic_safety/src/constants/textfield/app_text_field.dart';
import 'package:traffic_safety/src/utils/customs/custom_drop_down.dart';
import 'package:traffic_safety/src/utils/customs/custom_image_grid.dart';
import 'package:traffic_safety/src/utils/dialogs/failed_dialog.dart';
import 'package:traffic_safety/src/utils/dialogs/loading_dIalog.dart';
import 'package:traffic_safety/src/utils/dialogs/success_dialog.dart';
import 'package:traffic_safety/src/utils/services/location_service.dart';
import 'package:traffic_safety/src/utils/shared_preferences/shared_preferences.dart';
import 'package:traffic_safety/src/utils/text_validation/text_validation.dart';
import 'dart:io';

import 'model/hazard_model.dart';

@RoutePage()
class AddIssueScreen extends ConsumerStatefulWidget {
  const AddIssueScreen({super.key});

  @override
  ConsumerState<AddIssueScreen> createState() => _AddIssueScreenState();
}

class _AddIssueScreenState extends ConsumerState<AddIssueScreen> {
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

  List<String> roadSafetyHazards = [
    "Potholes",
    "Fallen Poles",
    "Fallen Trees",
    "Road Blocks",
    "Debris on the Road",
    "Poor Visibility",
    "Malfunctioning Traffic Signals",
    "Inadequate Signage",
    "Poor Road Markings",
    "Waterlogging and Flooding",
    "Unmaintained Infrastructure",
    "Wildlife Crossings",
    "Pedestrian Crosswalk Issues",
    "Lack of Emergency Services Access",
  ];

  final formKey = GlobalKey<FormState>();

  String? selectedIncident;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Issue'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              20.verticalSpace,
              Text(
                'Select Hazard Type',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              10.verticalSpace,
              CustomDropDownButton(
                items: roadSafetyHazards,
                hintText: "Select Hazard Type",
                selectedItem: selectedIncident,
                onChanged: (value) {
                  setState(() {
                    selectedIncident = value;
                  });
                },
              ),
              20.verticalSpace,
              Text(
                'Add Description',
                style: TextStyle(
                    color: Colors.black,
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
              AppButton(
                text: "Submit",
                onTap: () async {
                  final files = ref.read(pickedImageProvider('issueImage'));

                  if (selectedIncident != null &&
                      formKey.currentState!.validate()) {
                    if (files.isNotEmpty) {
                        showLoading(context);

                        Position? location;
                        try{
                          debugPrint('Getting Location');
                          location = await LocationService().getLocation();
                          debugPrint('Location : $location');
                        } catch(e){
                          print(e.toString());
                        }
                      if (location != null) {
                        final url = await _uploadImages(files);
                        Issue model = Issue(
                          hazardType: selectedIncident!,
                          coordinates: [location.latitude, location.longitude],
                          uid: UserPreferences.userId,
                          description: descriptionController.text.trim(),
                          images: url,
                        );

                      try{
                        await FirebaseFirestore.instance
                            .collection("issues")
                            .add(model.toJson());
                        if (context.mounted) {
                          successDialog(
                            context,
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              context.router.pop();
                            },
                          );
                        }

                      } catch (e){
                        if (context.mounted) {
                          failedDialog(
                            context,
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              context.router.pop();
                            },
                          );
                        }

                      }


                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Unable to Fetch Location.'),
                          ));
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: darkGreyColor,
                        content: Text('Please Add Images.'),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: darkGreyColor,
                      content: Text('Please select hazard type.'),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
