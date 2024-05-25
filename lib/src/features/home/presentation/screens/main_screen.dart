
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadradar/src/features/explore/presentation/screens/explore_screen.dart';
import 'package:roadradar/src/features/hazard/presentation/providers/hazard_provider.dart';
import 'package:roadradar/src/features/hazard/presentation/screens/add_hazard_issue_screen.dart';

import '../../../../core/app/theme/colors.dart';
import '../../../../core/app/router/router.gr.dart';
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

  List<Widget> pages = [
    HomeScreen(),
    ExploreScreen(coordinates: [LatLng(21.7051, 72.9959)]),
    AddHazardIssueScreen(),
    CommunityScreen(),
    HomeScreen(),
  ];
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
        unselectedItemColor: teal,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.map)
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.add)
          ),
          BottomNavigationBarItem(
            label: 'Community',
              icon: Icon(Icons.groups)
          ),
          BottomNavigationBarItem(
            label: 'You',
              icon: Icon(Icons.person)
          ),
        ],
      ),
    );
  }
}

