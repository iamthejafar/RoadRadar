import 'dart:collection';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:traffic_safety/src/app/router/router.gr.dart';
import 'package:traffic_safety/src/constants/buttons/app_button.dart';
import 'package:traffic_safety/src/constants/colors.dart';
import 'package:traffic_safety/src/features/add_incidents/add_incident_screen.dart';
import 'package:traffic_safety/src/features/home/screens/map_full_screen_view.dart';
import 'package:traffic_safety/src/features/home/widgets/multiple_image_grid_viewer.dart';
import 'package:traffic_safety/src/utils/shared_preferences/shared_preferences.dart';

import '../../add_incidents/model/hazard_model.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddIssueRoute());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'RoadSync',
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                UserPreferences.removeUser();
                UserPreferences.removeProfile();
                context.router.replaceAll([const AuthRoute()]);

              } ,
              icon: const Icon(Icons.logout, color: darkGreyColor,)
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("issues").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              QuerySnapshot data = snapshot.data as QuerySnapshot;
              if (data.docs.isNotEmpty) {
                final List<LatLng> coordinates = [];
                final List<Issue> models = [];

                for (var element in data.docs) {
                  final model = Issue.fromSnapshot(element);
                  models.add(model);
                  coordinates.add(
                      LatLng(model.coordinates.first, model.coordinates.last));
                }
                return ListView(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 200.h,
                        decoration: BoxDecoration(
                            color: mediumGreen,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r))),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: FlutterMap(
                                  options: MapOptions(
                                    center: coordinates.first,
                                    initialCameraFit: coordinates.length >= 2
                                        ? CameraFit.coordinates(
                                            coordinates: coordinates)
                                        : null,
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName:
                                          'com.example.roadsync',
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        for (final marker in coordinates)
                                          Marker(
                                              point: marker,
                                              child: const Icon(
                                                Icons.location_on,
                                                color: blueColor,
                                              ))
                                      ],
                                    )
                                  ]),
                            ),
                            IconButton(
                                onPressed: () {
                                  context.router.push(
                                      MapFullRoute(coordinates: coordinates));
                                },
                                icon: const Icon(Icons.fullscreen))
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          final model = Issue.fromSnapshot(data.docs[index]);
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MultipleImageGridViewer(images: model.images),
                                10.verticalSpace,
                                Row(
                                  children: [
                                    Text(
                                      "Hazard Type : ",
                                      style: TextStyle(
                                          color: blueColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      model.hazardType,
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  model.description,
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                5.verticalSpace,
                                AppButton(
                                  text: "Map VIew",
                                  onTap: () {
                                    final List<LatLng> cords = [];
                                    cords.add(coordinates[index]);
                                    context.router.push(
                                        MapFullRoute(coordinates: cords));
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    'No Issues available at a moment.\n Add new Issues.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: blueColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                );
              }
            } else {
              return const Text(
                  'No Issues available at a moment.\n Add new Issues.');
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
