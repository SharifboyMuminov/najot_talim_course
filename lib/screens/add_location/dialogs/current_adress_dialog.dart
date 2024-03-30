import 'package:default_project/data/models/place.dart';
import 'package:default_project/screens/googl_maps/widget/text_input.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

showCurrentAddressDialog({
  required BuildContext context,
  required ValueChanged<PlaceModel> placeModel,
}) {
  final TextEditingController textEditingControllerTitle =
      TextEditingController();
  final TextEditingController textEditingControllerSubTitle =
      TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext newContext, setState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.he, vertical: 20.he),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextInput(
                    textEditingController: textEditingControllerTitle,
                    hintText: 'Title',
                  ),
                  SizedBox(height: 30.he),
                  TextInput(
                    textEditingController: textEditingControllerSubTitle,
                    hintText: 'Sub title',
                  ),
                  SizedBox(height: 20.he),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (textEditingControllerTitle.text.isNotEmpty &&
                            textEditingControllerSubTitle.text.isNotEmpty) {
                          PlaceModel place = PlaceModel(
                            title: textEditingControllerTitle.text,
                            category: textEditingControllerSubTitle.text,
                            imagePath: "",
                            latLng: LatLng(0,0), id: '',
                          );
                          placeModel.call(place);

                          Navigator.pop(context);
                        }
                      },
                      child: Text("Ok"),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
