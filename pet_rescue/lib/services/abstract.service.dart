import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Services {

  Map getHeaders() {
      var headers = new Map();

      headers["Authorization"] = "Bearer xyz";

      return headers;

  }

  Future<SharedPreferences> getPreferences()async {
    return await SharedPreferences.getInstance();
  }

  Future<dynamic> getPreferenceById({id: String}) async {
    var prefs = await this.getPreferences();
    return prefs.get(id);
  }

  void setPreference({id: String, value}) {
    this.getPreferences()
        .then((prefs) => prefs.setString(id, value));
  }


}