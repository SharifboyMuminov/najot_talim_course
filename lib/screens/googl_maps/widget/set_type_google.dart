import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../view_models/maps_view_model.dart';

class SetTypeGoogleShow extends StatelessWidget {
  const SetTypeGoogleShow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context
                  .read<MapsViewModel>()
                  .oToTheLake();
            },
            child: const Icon(Icons.gps_fixed),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
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
    );
  }
}
