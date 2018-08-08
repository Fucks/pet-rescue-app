import 'package:flutter/material.dart';
import 'drawer.main.dart';
import '../widgets/map.dart';
import '../widgets/detail-dialog.dart';
import '../services/announces.service.dart';
import '../util/pageable.dart';
import '../services/location.service.dart';
import 'package:latlong/latlong.dart';

class Map extends StatelessWidget {

  AnnounceService announceService = new AnnounceService();

  Pageable markers;

  initState() async {
    LatLng location = await LocationService.getCurrentLocation();
    markers = await announceService.fetchAnnounces(location);
  }

  @override
  Widget build(BuildContext context) {

    initState();

    final FloatingActionButton __floatingButton = new FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('/form'),
      tooltip: 'Criar anuncio',
      child: new Icon(Icons.add),
    );

    return new Scaffold(
        drawer: new NavigationDrawer(),
        appBar: new AppBar(
          title: new Text('Anuncios'),
        ),
        body: new MapWidget(currentLocation: true, onMarkerTap: __onMarkerSelect, markers: markers.content),
        floatingActionButton: new Hero(tag: 'add-button',child: __floatingButton));
  }

  __onMarkerSelect(context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => new DetailDialog());
}
