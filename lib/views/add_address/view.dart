import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.0191987, 31.3884559),
    ),
  };
  final _controller = Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  String? myAddress, myMarkerLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إضافة عنوان"),
        leading: Container(
          height: 32.h,
          width: 32.w,
          padding: EdgeInsets.only(right: 5.w),
          margin: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            color: Theme.of(context).primaryColor.withOpacity(.13),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Theme.of(context).primaryColor),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 400.h,
          child: GoogleMap(
            circles: {
              Circle(
                circleId: CircleId("1"),
                fillColor: Theme.of(context).primaryColor.withOpacity(.3),
                center: LatLng(31.0191987, 31.3884559),
                radius: 10000,
                strokeColor: Colors.white,
              ),
            },
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
            markers: markers,
            onTap: (argument) async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  argument.latitude, argument.longitude);
              var element = placemarks.first;
              print(element.name);
              print(element.country);
              print(element.administrativeArea);
              print(element.locality);
              print(element.postalCode);
              print(element.subLocality);
              print(element.street);
              print(element.thoroughfare);
              print(element.subThoroughfare);
              myMarkerLocation =
                  "${element.country},${element.name}/ ${element.street}";
              print("0000000000000000000000000000000000");
              markers.add(
                Marker(
                  markerId: MarkerId("1"),
                  position: LatLng(argument.latitude, argument.longitude),
                ),
              );
              setState(() {});
              print(argument.latitude);
              print(argument.longitude);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(31.0360543,31.3697129),
              zoom: 14,
            ),
          ),
        ),
        if (myAddress != null) Text(myAddress!),
        if (myMarkerLocation != null) Text(myMarkerLocation!),
      ]),
      floatingActionButton: FloatingActionButton(child: Text("GO"),onPressed: () {
        goToLocation(
          location: LatLng(37.43296265331129, -122.08832357078792),
        );
        
      }),
    );
  }

  Future<void> goToLocation({required LatLng location}) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 14),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("1"),
        position: location,
      ),
    );

    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    var element = placemarks.first;
    print(element.name);
    print(element.country);
    print(element.administrativeArea);
    print(element.locality);
    print(element.postalCode);
    print(element.subLocality);
    print(element.street);
    print(element.thoroughfare);
    print(element.subThoroughfare);
    myAddress = "${element.country}/ ${element.street}/ ${element.locality}";

    print("////////////////////////");

    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (!serviceEnabled) {
      showmessage("Location services are disabled.", type: messageType.warning);

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var myPosition = await Geolocator.getCurrentPosition();
    print(myPosition.latitude);
    print(myPosition.longitude);
    print("****************************");

    goToLocation(location: LatLng(myPosition.latitude, myPosition.longitude));
    return myPosition;
  }
}
