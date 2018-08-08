import 'dart:async';
import 'dart:convert';
import '../entities/announce.entity.dart';
import 'package:http/http.dart' as http;
import '../constants.dart' as CONSTANTS;
import '../util/pageable.dart';
import 'abstract.service.dart';
import 'package:latlong/latlong.dart';

class AnnounceService extends Services {
  Future<Pageable> fetchAnnounces(LatLng position) async {
    await Future.delayed(const Duration(seconds: 5));

    var url = Uri.http(CONSTANTS.WS_SERVER, '/api/announce', {
      'latitude': position.latitude.toString(),
      'longitude': position.longitude.toString(),
      'distance': '500'
    });

    final response = await http.get(url, headers: this.getHeaders());

    final responseJson = json.decode(response.body);

    final page = Pageable.fromJson(responseJson);

    print(page);

    page.content = (responseJson['content'] as List)
        .map((ent) => Announce.fromJson(ent))
        .toList();

    return page;
  }
}
