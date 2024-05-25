import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadradar/src/constants/textfield/app_text_field.dart';

import '../../../../core/app/theme/colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key, required this.coordinates});

  final List<LatLng> coordinates;

  @override
  State<ExploreScreen> createState() => _ExploreScreenScreenState();
}

class _ExploreScreenScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: textTheme.displayLarge,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: mediumYellow,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r))),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: widget.coordinates.first,
                  initialCameraFit: widget.coordinates.length >= 2
                      ? CameraFit.coordinates(coordinates: widget.coordinates)
                      : null,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.roadradar',
                  ),
                  MarkerLayer(
                    markers: [
                      for (final marker in widget.coordinates)
                        Marker(
                          point: marker,
                          child: const Icon(
                            Icons.location_on,
                            color: mediumBlue,
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:  AppTextField(
                suffixIcon: Icon(Icons.search),
                hintText: "Enter nearby location",
              ),
            )
          ],
        ),
      ),
    );
  }
}
