import 'dart:async';
import 'dart:math';

import 'package:fieldx/Presentation/Widgets/Card/RouteCard/MapRouteBottomCard.dart';
import 'package:fieldx/Presentation/Widgets/CirculeLotti/CirculeLotti.dart';
import 'package:fieldx/Presentation/Widgets/LoadingWidget/MapLoadingAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';



class RouteMapPage extends StatefulWidget {
  @override
  _RouteMapPageState createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
  GoogleMapController googleMapController;
  Completer<GoogleMapController> _controller = Completer();
  String userAddress;
  double lanx;
  double lonx;
  LatLng _latLng=LatLng(23.819593425805156,90.41148873901344);
  String userId;
  var bitmapIcon;
  MapType _currentMapType = MapType.normal;
  Set<Marker> _markers = {};
  Set<Polyline>_polyline={};
  void getCureentLocation()async{
    var possition = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(possition.latitude);
    setState(()  {
      lanx=possition.latitude;
      lonx=possition.longitude;
      _latLng=LatLng(lanx,lonx);
    });
  }

  void getCureentLocationName()async {
    var possition = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    // print(possition.latitude);
    // print(possition.longitude);

    //location name
    final coordinates = new Coordinates(
        possition.latitude, possition.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);


    print("yyyy: " + addresses.first.addressLine);
    setState(() {
      userAddress = addresses.first.addressLine;
    });
  }
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }
  void getData() async{
    var users= await Hive.openBox('users');
    if (users.get('token') != null) {
      setState(() {
        userId=users.get('userId');
      });
    }
    bitmapIcon = await  BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10,10)), 'assets/images/smartphone.png');
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    // getCureentLocation();
    getCureentLocationName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Route Map"),),
      body:_latLng==null?Center(
        child: MapLoadingAnimation(),
      ):Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: 16,
            ),
            myLocationEnabled: true,
            polylines: _polyline,
            markers: _markers,
            zoomControlsEnabled: true,
            onMapCreated: onMapCreated,
            mapType: _currentMapType,
          ),


          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: FloatingActionButton(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                onPressed: ()=>{
                  getCureentLocation(),
                  googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: _latLng,
                        zoom: 17.0,
                      ),
                    ),
                  ),
                },
                child: Icon(FontAwesomeIcons.mapMarked),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child: FloatingActionButton(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                onPressed: ()=>{
                  _onMapTypeButtonPressed(),
                },
                child: Icon(FontAwesomeIcons.satellite),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                    child: SizedBox(
                      height: 100,
                      child: ListView(
                        physics:
                        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                              onTap: (){
                                setState(() {

                                });
                              },
                              child: MapRouteBottomCard()),

                        ],
                      ),
                    ),
                  )

            ),
          ),
        ],
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController=controller;
    googleMapController.setMapStyle(Utils.mapStyles).whenComplete(() {
      _controller.complete(controller);
    });


  }

}
class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}