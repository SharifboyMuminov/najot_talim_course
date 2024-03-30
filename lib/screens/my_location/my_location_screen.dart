import 'package:default_project/data/models/place.dart';
import 'package:default_project/screens/widgets/my_navigator.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/save_location_on_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../view_models/maps_view_model.dart';
import '../add_location/add_location_screen.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key});

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Screen"),
        actions: [
          IconButton(
            onPressed: () {
              myNavigatorPush(context, widget: AddLocationScreen());
            },
            icon: Icon(
              Icons.add,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: Consumer<SaveLocationOnFireBase>(
        builder: (BuildContext context, SaveLocationOnFireBase saveView,
            Widget? child) {
          if (saveView.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.he),
            itemCount:
                saveView.placeModels.length,
            itemBuilder: (BuildContext context, int index) {
              PlaceModel placeModel =
              saveView.placeModels[index];
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () async {
                    var mar = await context
                        .read<MapsViewModel>()
                        .getMarker(placeModel: placeModel);
                    myNavigatorPush(
                      context,
                      widget: AddLocationScreen(
                        placeModel: placeModel,
                        mar: mar,
                      ),
                    );
                  },
                  leading: Image.asset(
                    placeModel.imagePath,
                    width: 30,
                    height: 30,
                  ),
                  title: Text(
                    placeModel.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(placeModel.category),
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<SaveLocationOnFireBase>()
                          .deleteLocation(placeModel: placeModel);
                      context
                          .read<MapsViewModel>()
                          .removeMarket(placeModel: placeModel);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 24.sp,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
