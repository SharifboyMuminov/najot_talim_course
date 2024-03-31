import 'package:default_project/screens/add_location/add_location_screen.dart';
import 'package:default_project/screens/googl_maps/widget/location_button.dart';
import 'package:default_project/screens/my_location/my_location_screen.dart';
import 'package:default_project/screens/widgets/my_navigator.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/save_location_on_firebase.dart';
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
            builder: (BuildContext context, MapsViewModel mapsViewModel,
                Widget? child) {
              if (mapsViewModel.cameraPosition == null ||
                  context.watch<SaveLocationOnFireBase>().loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return GoogleMap(
                markers: mapsViewModel.markers,
                mapType: mapsViewModel.mapType,
                initialCameraPosition: mapsViewModel.cameraPosition!,
                onMapCreated: (v) {
                  mapsViewModel.googleController.complete(v);
                },
              );
            },
          ),
          if (!context.watch<SaveLocationOnFireBase>().loading)
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
                LocationButton(
                  onTab: () {
                    context.read<MapsViewModel>().oToTheLake();
                  },
                  icon: Icons.gps_fixed,
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.we, bottom: 20.he),
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
                LocationButton(
                  onTab: () {
                    myNavigatorPush(context, widget: const AddLocationScreen());
                  },
                  icon: Icons.add,
                ),
                LocationButton(
                  onTab: () {
                    myNavigatorPush(context, widget: const MyLocationScreen());
                  },
                  icon: Icons.save,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
