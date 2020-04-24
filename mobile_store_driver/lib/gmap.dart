import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GMap extends StatefulWidget {
  final LatLng latLng;
  GMap({Key key, this.latLng}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  bool _isStarted = false;
  Set<Marker> _markers = HashSet<Marker>();
  // Set<Polygon> _polygons = HashSet<Polygon>();
  // Set<Polyline> _polylines = HashSet<Polyline>();
  // Set<Circle> _circles = HashSet<Circle>();
  //bool _showMapStyle = false;

  //GoogleMapController _mapController;
  // BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    _getLocationPermission();
    //_setMarkerIcon();
    //_setPolygons();
    //_setPolylines();
    //_setCircles();
  }

  void _getLocationPermission() async {
    var location = new Location();
    try {
      location.requestPermission();
    } on Exception catch (_) {
      print('There was a problem allowing location access');
    }
  }

  // void _setMarkerIcon() async {
  //   _markerIcon =
  //       await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/noodle_icon.png');
  // }

  // void _toggleMapStyle() async {
  //   //String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');

  //   if (_showMapStyle) {
  //     //_mapController.setMapStyle(style);
  //     _mapController.setMapStyle(null);
  //   } else {
  //     _mapController.setMapStyle(null);
  //   }
  // }

  // void _setPolygons() {
  //   List<LatLng> polygonLatLongs = List<LatLng>();
  //   polygonLatLongs.add(LatLng(37.78493, -122.42932));
  //   polygonLatLongs.add(LatLng(37.78693, -122.41942));
  //   polygonLatLongs.add(LatLng(37.78923, -122.41542));
  //   polygonLatLongs.add(LatLng(37.78923, -122.42582));

  //   _polygons.add(
  //     Polygon(
  //       polygonId: PolygonId("0"),
  //       points: polygonLatLongs,
  //       fillColor: Colors.white,
  //       strokeWidth: 1,
  //     ),
  //   );
  // }

  // void _setPolylines() {
  //   List<LatLng> polylineLatLongs = List<LatLng>();
  //   polylineLatLongs.add(LatLng(37.74493, -122.42932));
  //   polylineLatLongs.add(LatLng(37.74693, -122.41942));
  //   polylineLatLongs.add(LatLng(37.74923, -122.41542));
  //   polylineLatLongs.add(LatLng(37.74923, -122.42582));

  //   _polylines.add(
  //     Polyline(
  //       polylineId: PolylineId("0"),
  //       points: polylineLatLongs,
  //       color: Colors.purple,
  //       width: 1,
  //     ),
  //   );
  // }

  // void _setCircles() {
  //   _circles.add(
  //     Circle(
  //         circleId: CircleId("0"),
  //         center: LatLng(37.76493, -122.42432),
  //         radius: 1000,
  //         strokeWidth: 2,
  //         fillColor: Color.fromRGBO(102, 51, 153, .5)),
  //   );
  // }

  void _onMapCreated(GoogleMapController controller) {
    //_mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: widget.latLng,
          infoWindow: InfoWindow(
            title: "Elm Company",
            snippet: "😍😍",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: widget.latLng,
              zoom: 14,
            ),
            markers: _markers,
            // polygons: _polygons,
            // polylines: _polylines,
            // circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
          ),
          _isStarted
              ? _showEndAndCancleButtons(context)
              : _showStartDeliveryButton(context)
        ],
      ),
    );
  }

  Widget _showStartDeliveryButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            onPressed: () {
              setState(() {
                _isStarted = !_isStarted;
              });
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Start Deleivry ", style: TextStyle(fontSize: 20)),
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget _showEndAndCancleButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            textColor: Colors.blue,
            child: Text("Back", style: TextStyle(fontSize: 20)),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 15),
        //   child: RaisedButton(
        //     shape: new RoundedRectangleBorder(
        //         borderRadius: new BorderRadius.circular(18.0),
        //         side: BorderSide(color: Colors.blue)),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     color: Colors.blue,
        //     textColor: Colors.white,
        //     child: Text("Start Deleivry ", style: TextStyle(fontSize: 20)),
        //   ),
        // ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
