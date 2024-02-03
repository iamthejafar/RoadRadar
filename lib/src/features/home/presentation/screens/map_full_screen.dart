import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/app/theme/colors.dart';




@RoutePage()
class MapFullScreen extends StatefulWidget {
  const MapFullScreen({super.key, required this.coordinates});
  
  final List<LatLng> coordinates;
  

  @override
  State<MapFullScreen> createState() => _MapFullScreenScreenState();
}

class _MapFullScreenScreenState extends State<MapFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map", style: TextStyle(color: black),),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: mediumYellow,
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
                      initialCenter: widget.coordinates.first,
                      initialCameraFit: widget.coordinates.length >= 2
                          ? CameraFit.coordinates(
                          coordinates: widget.coordinates)
                          : null,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                        'com.example.roadradar',
                      ),
                      MarkerLayer(
                        markers: [
                          for (final marker in widget.coordinates)
                            Marker(
                                point: marker,
                                child: const Icon(Icons.location_on,color: mediumBlue,)
                            )
                        ],
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}
