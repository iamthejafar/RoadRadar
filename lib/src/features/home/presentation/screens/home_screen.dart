
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadradar/src/constants/constants.dart';
import 'package:roadradar/src/dependency_injection/dependency_injection.dart';
import 'package:roadradar/src/features/hazard/presentation/providers/hazard_provider.dart';

import '../../../../constants/buttons/app_button.dart';
import '../../../../core/app/theme/colors.dart';
import '../../../../core/app/router/router.gr.dart';
import '../../../../domain/models/home/hazard_model.dart';
import '../../../../utils/shared_preferences/shared_preferences.dart';
import '../widgets/multiple_image_grid_viewer.dart';




@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ref.watch(hazardProvider);
    final loadingState = controller.state;


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddHazardIssueRoute());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: Image.asset('assets/images/logo.png'),
        title: const Text(
          'Road Radar',
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                UserPreferences.removeUser();
                UserPreferences.removeProfile();
                context.router.replaceAll([const AuthRoute()]);
              },
              icon: const Icon(Icons.logout, color: darkGrey,)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 20.h),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.hazards.length,
          itemBuilder: (context, index) {
            if(loadingState == HazardNotifierState.loading){
              return const Center(child: CircularProgressIndicator());
            }
            else if(loadingState == HazardNotifierState.error){
              return const Center(child: Text('No Issue available, Add New Issue'),);
            }
            else if(loadingState == HazardNotifierState.loaded){
              final model = controller.hazards[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                  color: grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MultipleImageGridViewer(images: model.hazardImages),
                    10.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hazard Type : ",
                          style: TextStyle(
                              color: mediumBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                        Expanded(
                          child: Text(
                            model.hazardType,
                            style: TextStyle(
                                color: black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      model.description,
                      style: TextStyle(
                          color: black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    5.verticalSpace,
                    AppButton(
                      text: "Map VIew",
                      onTap: () {
                        // final List<LatLng> cords = [];
                        // cords.add(coordinates[index]);
                        // context.router.push(
                        //     MapFullRoute(coordinates: cords));
                      },
                    )
                  ],
                ),
              );

            }

          },
        ),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection("issues").snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.hasData) {
      //         QuerySnapshot data = snapshot.data as QuerySnapshot;
      //         if (data.docs.isNotEmpty) {
      //           final List<LatLng> coordinates = [];
      //           final List<HazardIssueModel> models = [];
      //
      //           for (var element in data.docs) {
      //             final model = HazardIssueModel.fromSnapshot(element);
      //             models.add(model);
      //             coordinates.add(
      //                 LatLng(model.coordinates.first, model.coordinates.last));
      //           }
      //           return ListView(
      //             children: [
      //               Container(
      //                   padding: const EdgeInsets.all(10),
      //                   height: 200.h,
      //                   decoration: BoxDecoration(
      //                       color: mediumYellow,
      //                       borderRadius: BorderRadius.only(
      //                           bottomLeft: Radius.circular(10.r),
      //                           bottomRight: Radius.circular(10.r))),
      //                   child: Stack(
      //                     alignment: Alignment.bottomRight,
      //                     children: [
      //                       ClipRRect(
      //                         borderRadius: BorderRadius.circular(10.r),
      //                         child: FlutterMap(
      //                             options: MapOptions(
      //                               // ignore: deprecated_member_use
      //                               center: coordinates.first,
      //                               initialCameraFit: coordinates.length >= 2
      //                                   ? CameraFit.coordinates(
      //                                       coordinates: coordinates)
      //                                   : null,
      //                             ),
      //                             children: [
      //                               TileLayer(
      //                                 urlTemplate:
      //                                     'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      //                                 userAgentPackageName:
      //                                     'com.example.roadradar',
      //                               ),
      //                               MarkerLayer(
      //                                 markers: [
      //                                   for (final marker in coordinates)
      //                                     Marker(
      //                                         point: marker,
      //                                         child: const Icon(
      //                                           Icons.location_on,
      //                                           color: mediumBlue,
      //                                         ))
      //                                 ],
      //                               )
      //                             ]),
      //                       ),
      //                       IconButton(
      //                           onPressed: () {
      //                             context.router.push(
      //                                 MapFullRoute(coordinates: coordinates));
      //                           },
      //                           icon: const Icon(Icons.fullscreen))
      //                     ],
      //                   )),
      //               Padding(
      //                 padding: EdgeInsets.symmetric(
      //                     horizontal: 20.w, vertical: 20.h),
      //                 child: ListView.builder(
      //                   physics: const NeverScrollableScrollPhysics(),
      //                   shrinkWrap: true,
      //                   itemCount: data.docs.length,
      //                   itemBuilder: (context, index) {
      //                     final model = HazardIssueModel.fromSnapshot(data.docs[index]);
      //                     return Container(
      //                       margin: EdgeInsets.symmetric(vertical: 10.h),
      //                       padding: const EdgeInsets.all(10),
      //                       decoration: BoxDecoration(
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: black.withOpacity(0.1),
      //                             spreadRadius: 1,
      //                             blurRadius: 2,
      //                           ),
      //                         ],
      //                         color: grey,
      //                         borderRadius: BorderRadius.circular(10.r),
      //                       ),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           MultipleImageGridViewer(images: model.images),
      //                           10.verticalSpace,
      //                           Row(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(
      //                                 "Hazard Type : ",
      //                                 style: TextStyle(
      //                                     color: mediumBlue,
      //                                     fontWeight: FontWeight.w500,
      //                                     fontSize: 14.sp),
      //                               ),
      //                               Expanded(
      //                                 child: Text(
      //                                   model.hazardType,
      //                                   style: TextStyle(
      //                                       color: black,
      //                                       fontSize: 14.sp,
      //                                       fontWeight: FontWeight.w500),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           Text(
      //                             model.description,
      //                             style: TextStyle(
      //                                 color: black,
      //                                 fontSize: 14.sp,
      //                                 fontWeight: FontWeight.w500),
      //                           ),
      //                           5.verticalSpace,
      //                           AppButton(
      //                             text: "Map VIew",
      //                             onTap: () {
      //                               final List<LatLng> cords = [];
      //                               cords.add(coordinates[index]);
      //                               context.router.push(
      //                                   MapFullRoute(coordinates: cords));
      //                             },
      //                           )
      //                         ],
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               ),
      //             ],
      //           );
      //         } else {
      //           return Center(
      //             child: Text(
      //               'No Issues available at a moment.\n Add new Issues.',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                   color: mediumBlue,
      //                   fontWeight: FontWeight.w500,
      //                   fontSize: 14.sp),
      //             ),
      //           );
      //         }
      //       } else {
      //         return const Text(
      //             'No Issues available at a moment.\n Add new Issues.');
      //       }
      //     } else {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
