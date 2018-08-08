import 'package:flutter/material.dart';

class MapMarker extends StatefulWidget {
  MapMarker({Key key, this.isCurrent = false, @required this.onTap})
      : super(key: key);

  final bool isCurrent;
  var onTap;

  @override
  __MapMarkerState createState() =>
      __MapMarkerState(onTap: this.onTap, isCurrent: isCurrent);

}

class __MapMarkerState extends State<MapMarker> {
  __MapMarkerState({@required this.onTap, this.isCurrent});

  var onTap;
  bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: this.onTap,
      child: this.isCurrent ? new _CurrentPositionMarker() : new _AlwaysPositionMarker(),
    );
  }

}

class _CurrentPositionMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      new Opacity(
          opacity: 0.7,
          child: new Image.asset('images/current_location_marker.png'));

}

class _AlwaysPositionMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      new Opacity(
          opacity: 0.7,
          child: new Image.asset('images/current_location_marker.png'));
}