import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../view_models/maps_view_model.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  String pngPath = "assets/images/work.png";

  @override
  Widget build(BuildContext context) {
    var mapsView = Provider.of<MapsViewModel>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Consumer<MapsViewModel>(
            builder:
                (BuildContext context, MapsViewModel mapsViewModel, Widget? child) {
              if (mapsViewModel.cameraPosition == null) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return GoogleMap(
                markers: mapsViewModel.markers,
                mapType: mapsViewModel.mapType,
                initialCameraPosition: mapsViewModel.cameraPosition!,
                // onMapCreated: (v) {
                //   mapsViewModel.googleController.complete(v);
                // },
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/local.png",
              width: 50,
              height: 50,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10.we),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    onPressed: () {
                      context.read<MapsViewModel>().oToTheLake();
                    },
                    child: const Icon(
                      Icons.gps_fixed,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                20.getH(),
                Container(
                  margin: EdgeInsets.only(right: 10.we),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.blue,
                  ),
                  child: PopupMenuButton(
                    padding: const EdgeInsets.all(20),
                    icon: const Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Text("Normal"),
                          onTap: () {
                            context
                                .read<MapsViewModel>()
                                .startPosition(MapType.normal);
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("hybrid"),
                          onTap: () {
                            context
                                .read<MapsViewModel>()
                                .startPosition(MapType.hybrid);
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("satellite"),
                          onTap: () {
                            context
                                .read<MapsViewModel>()
                                .startPosition(MapType.satellite);
                          },
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
