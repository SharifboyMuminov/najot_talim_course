import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/save_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../data/models/place.dart';
import '../../view_models/maps_view_model.dart';
import 'widget/set_type_google.dart';
import 'widget/category_item.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key, this.placeModel, this.mar});

  final PlaceModel? placeModel;
  final Set<Marker>? mar;

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  String pngPath = "assets/images/work.png";
  CameraPosition? cameraPosition;
  PlaceModel? placeModelMy;



  @override
  void initState() {
    placeModelMy = widget.placeModel;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var mapsView = Provider.of<MapsViewModel>(context, listen: false);
    // getMar(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          placeModelMy != null ? placeModelMy!.category : "Add New Location",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<MapsViewModel>(
        builder:
            (BuildContext context, MapsViewModel mapsViewModel, Widget? child) {
          if (mapsViewModel.cameraPosition == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Stack(
            children: [
              GoogleMap(
                onCameraMove: (v) {
                  cameraPosition = v;
                },
                markers: widget.mar != null ? widget.mar! : mapsViewModel.markers,
                mapType: mapsViewModel.mapType,
                initialCameraPosition: placeModelMy == null
                    ? mapsViewModel.cameraPosition!
                    : CameraPosition(
                        target: LatLng(
                          placeModelMy!.lat,
                          placeModelMy!.long,
                        ),
                        zoom: 15,
                      ),
                // onMapCreated: (v) {
                //   mapsViewModel.googleController.complete(v);
                // },
              ),
              if (placeModelMy == null)
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    placeModelMy != null
                        ? placeModelMy!.imagePath
                        : "assets/images/local.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              if (placeModelMy == null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 20.we, vertical: 20.he),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryItem(
                              pngPath: "assets/images/home.png",
                              onTab: () {
                                pngPath = "assets/images/home.png";
                                setState(() {});
                              },
                              active: pngPath == "assets/images/home.png",
                            ),
                            CategoryItem(
                              pngPath: "assets/images/work.png",
                              onTab: () {
                                pngPath = "assets/images/work.png";
                                setState(() {});
                              },
                              active: pngPath == "assets/images/work.png",
                            ),
                            CategoryItem(
                              pngPath: "assets/images/local.png",
                              onTab: () {
                                pngPath = "assets/images/local.png";
                                setState(() {});
                              },
                              active: pngPath == "assets/images/local.png",
                            ),
                          ],
                        ),
                        20.getH(),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              padding: const EdgeInsets.all(10),
                            ),
                            onPressed: () {
                              if (cameraPosition != null) {
                                String category =
                                    pngPath.replaceAll("assets/images/", "");
                                category = category.replaceAll(".png", "");
                                PlaceModel place = PlaceModel(
                                  lat: cameraPosition!.target.latitude,
                                  long: cameraPosition!.target.longitude,
                                  title: "asdfasdf",
                                  category: category,
                                  imagePath: pngPath,
                                );
                                context
                                    .read<MapsViewModel>()
                                    .newCurrentPosition(
                                        placeModel: place,
                                        cameraPosition: cameraPosition!);
                                context
                                    .read<SaveLocation>()
                                    .insertLocation(place);

                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 19.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              SetTypeGoogleShow(),
            ],
          );
        },
      ),
    );
  }
}
