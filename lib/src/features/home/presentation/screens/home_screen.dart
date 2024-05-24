import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadradar/src/features/hazard/presentation/providers/hazard_provider.dart';

import '../../../../constants/buttons/app_button.dart';
import '../../../../core/app/theme/colors.dart';
import '../../../../core/app/router/router.gr.dart';
import '../../../../utils/shared_preferences/shared_preferences.dart';
import '../widgets/multiple_image_grid_viewer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ref.watch(hazardProvider);
    final loadingState = controller.state;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          title: Row(
            children: [
              SizedBox(
                  height: 40.h, child: Image.asset('assets/images/logo.png')),
              Text(
                'Road Radar',
                style: textTheme.displayLarge,
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              radius: 20.h,
              backgroundImage: Image.network(
                      "https://media.licdn.com/dms/image/D4D03AQGkMuI3phuvFg/profile-displayphoto-shrink_400_400/0/1710682345759?e=1721865600&v=beta&t=F86KEbq83hjBUQhCtsZksHIj3u8IY7jjyZewUvC07lA")
                  .image,
            ),
            5.horizontalSpace
            // IconButton(
            //     onPressed: () {
            //       UserPreferences.removeUser();
            //       UserPreferences.removeProfile();
            //       context.router.replaceAll([const AuthRoute()]);
            //     },
            //     icon: const Icon(
            //       Icons.logout,
            //       color: darkGrey,
            //     ))
          ],
        ),
        // SliverList.builder(
        //     itemCount: controller.hazards.length,
        //     itemBuilder: (context, index) {
        //       if(loadingState == HazardNotifierState.loading){
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //       else if(loadingState == HazardNotifierState.error){
        //         return const Center(child: Text('No Issue available, Add New Issue'),);
        //       }
        //       else if(loadingState == HazardNotifierState.loaded){
        //         final model = controller.hazards[index];
        //         return Container(
        //           padding: const EdgeInsets.all(10),
        //           decoration: BoxDecoration(
        //             color: grey,
        //           ),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               MultipleImageGridViewer(images: model.hazardImages),
        //               10.verticalSpace,
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Hazard Type : ",
        //                     style: TextStyle(
        //                         color: mediumBlue,
        //                         fontWeight: FontWeight.w500,
        //                         fontSize: 14.sp),
        //                   ),
        //                   Expanded(
        //                     child: Text(
        //                       model.hazardType,
        //                       style: TextStyle(
        //                           color: black,
        //                           fontSize: 14.sp,
        //                           fontWeight: FontWeight.w500),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               Text(
        //                 model.description,
        //                 style: TextStyle(
        //                     color: black,
        //                     fontSize: 14.sp,
        //                     fontWeight: FontWeight.w500),
        //               ),
        //               5.verticalSpace,
        //               AppButton(
        //                 text: "Map VIew",
        //                 onTap: () {
        //                   // final List<LatLng> cords = [];
        //                   // cords.add(coordinates[index]);
        //                   // context.router.push(
        //                   //     MapFullRoute(coordinates: cords));
        //                 },
        //               )
        //             ],
        //           ),
        //         );
        //       }
        //       return null;
        //     }
        // ),

        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                child: Column(
                  children: [
                   Row(
                     children: [

                     ],
                   )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
