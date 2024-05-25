import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:roadradar/src/core/app/theme/colors.dart';

import '../../../home/presentation/screens/home_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with TickerProviderStateMixin {
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
            "Community!",
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
                    "Trending",
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
                    "Events",
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
                  return MasonryGridView.builder(
                    itemCount: 10,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if (i >= 4) i = 0;
                      return SizedBox(
                        height: (i++ % 5 + 2) * 100,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
              ),
              Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: greenYellow,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stand Up Comedy By",
                                style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "Samay Raina, Zakir Khan, Munnawar Faruqui",
                                style: textTheme.bodySmall!
                                    .copyWith(color: Colors.black),
                              ),
                              5.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Venue",
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Rotary Club Bharuch",
                                        style: textTheme.bodySmall!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    backgroundColor: greenYellow,
                                    radius: 20.h,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/microphone.png"),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Speech On Road Safety By",
                                style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "Nitin Gadkari",
                                style: textTheme.bodySmall!
                                    .copyWith(color: Colors.black),
                              ),
                              5.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Venue",
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Rotary Club Bharuch",
                                        style: textTheme.bodySmall!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    backgroundColor: teal,
                                    radius: 20.h,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/speech.png"),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
