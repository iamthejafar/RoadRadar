import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:io';

import '../../../../../global_providers.dart';
import '../../../../constants/buttons/app_button.dart';
import '../../../../core/app/theme/colors.dart';
import '../../../../constants/textfield/app_text_field.dart';
import '../../../../domain/models/home/hazard_model.dart';
import '../../../../utils/customs/custom_drop_down.dart';
import '../../../../utils/customs/custom_image_grid.dart';
import '../../../../utils/dialogs/failed_dialog.dart';
import '../../../../utils/dialogs/loading_dIalog.dart';
import '../../../../utils/dialogs/success_dialog.dart';
import '../../../../utils/services/location_service.dart';
import '../../../../utils/shared_preferences/shared_preferences.dart';
import '../../../../utils/text_validation/text_validation.dart';


@RoutePage()
class AddHazardIssueScreen extends ConsumerStatefulWidget {
  const AddHazardIssueScreen({super.key});

  @override
  ConsumerState<AddHazardIssueScreen> createState() => _AddIssueScreenState();
}

class _AddIssueScreenState extends ConsumerState<AddHazardIssueScreen> {
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
                    color: black,
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
                          if(context.mounted){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString()),),);                         
                          }
                        }
                      if (location != null) {
                        final url = await _uploadImages(files);
                        HazardIssueModel model = HazardIssueModel(
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
                              ref.read(pickedImageProvider('issueImage').notifier).dispose();
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
                              ref.read(pickedImageProvider('issueImage').notifier).dispose();
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
                        backgroundColor: darkGrey,
                        content: Text('Please Add Images.'),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: darkGrey,
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
