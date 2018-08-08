import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import '../services/location.service.dart';
import 'loading.dart';
import 'map-marker.dart';

class MapWidget extends StatefulWidget {
  MapWidget({Key key, this.markers, this.currentLocation, this.center, this.zoom = 13.0, this.onMarkerTap})
      : super(key: key);

  final List markers;
  final bool currentLocation;
  final LatLng center;
  final double zoom;
  final Function onMarkerTap;

  @override
  MapState createState() => new MapState(
      markers: this.markers, showCurrentLocation: currentLocation, center: center, zoom: zoom, onMarkerTap: this.onMarkerTap);
}

class MapState extends State<MapWidget> {
  MapState({this.markers, this.showCurrentLocation = true, this.center, this.zoom, this.onMarkerTap});

  final bool showCurrentLocation;
  final LatLng center;
  final double zoom;
  final Function onMarkerTap;
  final List markers;

  LatLng currentLocation = null;
  var isLoading = false;

  init() async {
    LatLng location = null;

    if (showCurrentLocation) {
      location = await LocationService.getCurrentLocation();
    }

    this.setState(() {
      this.currentLocation = location;
      this.isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    if (showCurrentLocation) {
      this.isLoading = true;
    }

    init();
  }

  @override
  Widget build(BuildContext context) {
    if (this.isLoading) {
      return new Loading();
    } else {
      var _markers = new List<Marker>();

      if (showCurrentLocation) {
        _markers.add(new Marker(
            width: 26.0,
            height: 26.0,
            point: this.currentLocation,
            builder: (ctx) => new MapMarker(
                  onTap: () => onTap(ctx),
                  isCurrent: true,
                )));
      }

      if(markers.isNotEmpty) {
        _markers.addAll(markers.map((mrk) => new Marker(
            width: 26.0,
          height: 26.0,
          point: mrk.position,
          builder: (ctx) => new MapMarker(onTap: () => onTap(ctx))
        )));
      }

      return new Container(
          child: new FlutterMap(
        options: new MapOptions(
          center: showCurrentLocation ? this.currentLocation : this.center,
          zoom: this.zoom,
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiZnVja3MiLCJhIjoiY2ppNnBtcTlsMDNjcTNxcHA1YmpzYzhteSJ9.Z7T01iNUCxEUcWxpPeSXmw',
              'id': 'mapbox.streets',
            },
          ),
          new MarkerLayerOptions(
            markers: _markers,
          ),
        ],
      ));
    }
  }

  onTap(context) {
    if(this.onMarkerTap != null){
      this.onMarkerTap(context);
    }
  }
}
