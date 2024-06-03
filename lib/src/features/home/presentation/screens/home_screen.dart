import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadradar/src/features/hazard/presentation/providers/hazard_provider.dart';

import '../../../../core/app/theme/colors.dart';
import '../widgets/user_post_widget.dart';

const imageUrl =
    "https://media.licdn.com/dms/image/D4D03AQGkMuI3phuvFg/profile-displayphoto-shrink_400_400/0/1710682345759?e=1721865600&v=beta&t=F86KEbq83hjBUQhCtsZksHIj3u8IY7jjyZewUvC07lA";

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    ref.watch(hazardProvider);
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
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 90),
            child: SizedBox(
              height: 90,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("assets/images/car_driving.png"),
                 10.horizontalSpace,
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         "Learn to drive safely with our Driving Partners.",
                         style: textTheme.bodyMedium,
                       ),
                       Align(
                         alignment: Alignment.centerRight,
                         child: Container(
                           margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                           decoration: BoxDecoration(
                               color: deepBlue,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           padding: const EdgeInsets.all(5),
                           child: Text("Enquire",style: textTheme.bodySmall!.copyWith(color: white),),
                         ),
                       )
                     ],
                   ),
                 )
                ],
              ),
            ),
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
              const UserPost(),
              const UserPost(),
              const UserPost(),
            ],
          ),
        ),
      ],
    );
  }
}


