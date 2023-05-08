import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mysports/user/drawer/user_drawer.dart';

class user_home extends StatefulWidget {
  const user_home({super.key});

  @override
  State<user_home> createState() => _user_homeState();
}

class _user_homeState extends State<user_home> {
  LocationData? _livelocation;
  GoogleMapController? _controller;
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();

  Future _getlocation() async {
    Location location = Location();
    await location.getLocation().then(
          (location) => {
            setState(() {
              _livelocation = location;
            })
          },
        );
  }

  @override
  void initState() {
    _getlocation();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerscaffoldkey,
      drawer: user_drawer(),
      body: _livelocation != null
          ? GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              // onTap: (LatLng l) {
              //   print(fun.get_address(l));
              // },
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              //markers: marker!.map((e) => e).toSet(),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  _livelocation!.latitude!,
                  _livelocation!.longitude!,
                ),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
    );
  }
}
