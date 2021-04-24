import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myride/views/constants.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class HomePage extends StatelessWidget {
  Completer<PlatformMapController> _controllerGoogleMap = Completer();
  PlatformMapController newGooglemapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PlatformMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: const LatLng(47.6, 8.8796),
                zoom: 16.0,
              ),
              onMapCreated: (PlatformMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGooglemapController = controller;
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: kGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search Car",
                          style: TextStyle(fontSize: 15, color: kGrey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: kGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Home Address",
                          style: TextStyle(fontSize: 15, color: kGrey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: kGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Office Address",
                          style: TextStyle(fontSize: 15, color: kGrey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
