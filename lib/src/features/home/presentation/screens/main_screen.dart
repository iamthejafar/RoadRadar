
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadradar/src/features/explore/presentation/screens/explore_screen.dart';
import 'package:roadradar/src/features/hazard/presentation/providers/hazard_provider.dart';
import 'package:roadradar/src/features/hazard/presentation/screens/create_post.dart';

import '../../../../core/app/theme/colors.dart';
import '../../../community/presentation/screens/community_screen.dart';
import 'home_screen.dart';




@RoutePage()
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MainScreen> {

  int currentIndex = 0;

  List<Widget> pages = const [
    HomeScreen(),
    ExploreScreen(coordinates: [LatLng(21.7051, 72.9959)]),
    CreatePost(),
    CommunityScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    ref.watch(hazardProvider);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: mediumYellow,
        selectedItemColor: deepBlue,
        unselectedItemColor: darkGrey,
        selectedLabelStyle: textTheme.bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: deepBlue),
        unselectedLabelStyle:textTheme.bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: darkGrey),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(currentIndex == 0 ? FontAwesomeIcons.houseChimney :CupertinoIcons.home )
          ),
          BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(currentIndex == 1 ? FontAwesomeIcons.mapLocationDot : FontAwesomeIcons.map)
          ),
          const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.add)
          ),
          BottomNavigationBarItem(
            label: 'Community',
              icon: Icon(currentIndex == 3 ? CupertinoIcons.group_solid : CupertinoIcons.group)
          ),
          BottomNavigationBarItem(
            label: 'You',
              icon: Icon(currentIndex == 4 ? CupertinoIcons.person_fill : CupertinoIcons.person)
          ),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}

