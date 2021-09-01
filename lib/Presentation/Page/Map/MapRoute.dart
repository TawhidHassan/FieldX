import 'dart:async';
import 'dart:math';

import 'package:fieldx/Bloc/Route/route_cubit.dart';
import 'package:fieldx/Bloc/Shop/shop_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Data/Model/Shop/ShopResponse.dart';
import 'package:fieldx/Presentation/Widgets/Card/RouteCard/MapRouteBottomCard.dart';
import 'package:fieldx/Presentation/Widgets/CirculeLotti/CirculeLotti.dart';
import 'package:fieldx/Presentation/Widgets/LoadingWidget/MapLoadingAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  int userId;
  String token;
  var bitmapIcon;
  MapType _currentMapType = MapType.normal;
  List<Marker> _markers = [];
  ShopResponse shopResponse=null;


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
        token=users.get('token');
        BlocProvider.of<RouteCubit>(context).loadRouteForUser(userId,token);
      });
    }
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
          BlocListener<ShopCubit, ShopState>(
            listener: (context, state) {
              if(state is GetShop){
                final dataxx=(state as GetShop).shopResponse;
                shopResponse=dataxx;
                setMarker();
              }
            },
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _latLng,
                zoom: 16,
              ),
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
              zoomControlsEnabled: true,
              onMapCreated: onMapCreated,
              mapType: _currentMapType,
            ),
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
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
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
          BlocBuilder<RouteCubit, RouteState>(
            builder: (context, state) {
              if(!(state is GetRoute)){
                return Center(child: CircularProgressIndicator(),);
              }
              final data=(state as GetRoute).routeResponse;
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SizedBox(
                        height: 100,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics:
                            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            children:  data.data.map((data) =>  Container(
                              margin: EdgeInsets.only(bottom: 14),
                              child:  InkWell(
                                  onTap: (){
                                    BlocProvider.of<ShopCubit>(context).loadShopByRoute(data.id,token);

                                  },
                                  child: MapRouteBottomCard(name: data.name,)),
                            )
                            ).toList()
                        ),
                      ),
                    )

                ),
              );
            },
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

  void setMarker()  async{
    var rng = new Random();
    bitmapIcon =await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10,10)), 'assets/images/smartphone.png');
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target:  LatLng(double.parse(shopResponse.data[0].lat),double.parse(shopResponse.data[0].long)),
          zoom: 15.0,
        ),
      ),
    );
    if(shopResponse.data.isNotEmpty) {
      shopResponse.data.forEach((e) {
        print("ssss");
        setState((){
          lanx=double.parse(e.lat);
          lonx=double.parse(e.long);

          _markers.add(
              Marker(
                markerId: MarkerId(e.name+rng.nextInt(100).toString()),
                position: LatLng(lanx,lonx),
                infoWindow: InfoWindow(
                    title: e.name,
                  onTap: (){
                    Navigator.pushNamed(context, SHOP_PAGE, arguments: {
                      'shopId':e.id
                    });
                  }
                ),
                icon: bitmapIcon,
              )
          );

        });
      });
    }



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