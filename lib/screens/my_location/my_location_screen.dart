import 'package:default_project/data/models/place.dart';
import 'package:default_project/screens/widgets/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/maps_view_model.dart';
import '../../view_models/save_location.dart';
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
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<SaveLocation>().placeModels.length,
        itemBuilder: (BuildContext context, int index) {
          PlaceModel placeModel =
              context.watch<SaveLocation>().placeModels[index];
          return ListTile(
            onTap: () async {
              var mar = await context
                  .read<MapsViewModel>()
                  .getMarker(placeModel: placeModel);
              myNavigatorPush(context,
                  widget: AddLocationScreen(
                    placeModel: placeModel,
                    mar: mar,
                  ));
            },
            leading: Image.asset(
              placeModel.imagePath,
              width: 30,
              height: 30,
            ),
            title: Text(placeModel.title),
            subtitle: Text(placeModel.category),
          );
        },
      ),
    );
  }
}
