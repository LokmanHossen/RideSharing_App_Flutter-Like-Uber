import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourcceLocation = LatLng(37.33500926, -122.03272188);

  // LatLng? pickLocation;
  // loc.Location location = loc.Location();
  // String? _address;

  // final Completer<GoogleMapController> _controllergoogleMap = Completer();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  // GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // double searchLocationContainerHeight = 220;
  // double waitingResponsefromDriverContainerHeight = 0;
  // double assignedDriverInfoContainerHeight = 0;

  // Position? userCurrentPosition;
  // var geoLocation = Geolocator();

  // LocationPermission? _locationPermission;
  // double bottomPaddingMAp = 0;

  // List<LatLng> pLineCordinatedList = [];
  // Set<Polyline> polylineSet = {};

  Set<Marker> markersSet = {};
  // Set<Circle> circlesSet = {};

  // String userName = "";
  // String userEmail = "";

  // bool openNavigatonDrawer = true;
  // bool activeNearDriverKeysLoaded = false;

  // BitmapDescriptor? activeNearbyIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: sourcceLocation,
            zoom: 14.5,
          ),
        ),
      ),
    );
  }
}
