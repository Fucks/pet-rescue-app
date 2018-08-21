import 'package:http/http.dart' as http;
import 'package:pet_rescue/services/abstract.service.dart';
import 'dart:convert';
import '../util/constants.dart';
import 'dart:async';

class LoginService extends Services {
  Map<String, String> __header = {
    'Authorization': 'Basic ' + base64Encode(utf8.encode('$CLIENT:$CLIENT_PWD'))
  };

  void Login({username: String, password: String}) async {
    final __Credentials = {
      'username': username,
      'password': password,
      'client_id': CLIENT,
      'grant_type': 'password'
    };

    try {
      final response = await http.post('$SERVER_URL/oauth/token',
          headers: __header, body: __Credentials);

      if (response.statusCode == 500)
        throw Exception('Erro ao tentar realizar o login.');

      if (response.statusCode == 400)
        throw Exception('Usuário ou senha inválidos.');

      if (response.statusCode != 200)
        throw Exception('Sistema indisponível no momento.');

      var responseParsed = json.decode(response.body);

      __VerifyAndStoreCredentials(
          username: __Credentials['username'],
          password: __Credentials['password']);

      //store tokens
      this.setPreference(id: 'token', value: responseParsed['token']);
      this.setPreference(
          id: 'refreshToken', value: responseParsed['refreshToken']);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> VerifyUser() async {
    var username = this.getPreferenceById(id: 'username');
    var password = this.getPreferenceById(id: 'password');

    if (username == null || password == null) {
      return false;
    }

    await this.Login(username: username, password: password);

    return true;
  }

  void __VerifyAndStoreCredentials({username: String, password: String}) async {
    var __credentials = this.getPreferenceById(id: 'credentials');
    if (__credentials != null) return;

    //salva se não possuir
    var __credentialsJson =
        json.encode({'username': username, 'password': password});
    this.setPreference(id: 'credentials', value: __credentialsJson);
  }
}
