import 'package:flutter/material.dart';
import '../services/login.service.dart';
import 'dart:async';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  var username, password;

  final __LoginService = new LoginService();
  final __usernameCtrl = new TextEditingController();
  final __passwordCtrl = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final __spacer = Padding(padding: EdgeInsets.all(8.0));
  String __errorMessage = null;

  void setError(message) {
    setState(() => __errorMessage = message);

    Future
        .delayed(Duration(seconds: 15))
        .whenComplete(() => setState(() => __errorMessage = null));
  }

  void login() async {
    if (!_formKey.currentState.validate()) return;

    try {
      await __LoginService.Login(
          username: __usernameCtrl.text, password: __passwordCtrl.text);

      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      setError(e.message);
    }
  }

  @override
  void dispose() {
    __passwordCtrl.dispose();
    __usernameCtrl.dispose();
    super.dispose();
  }

  Widget buildForm() {
    return Center(
        child: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(
        children: [buildInputsSection(), buildButtonsSection()],
      ),
    )));
  }

  Widget buildInputsSection() {
    var __inputBorder = new OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)));

    var __inputValidation = (text) => text.isEmpty ? 'Campo obrigatório' : null;

    var __usernameInput = TextFormField(
      controller: __usernameCtrl,
      validator: __inputValidation,
      decoration: InputDecoration(
          border: __inputBorder,
          isDense: false,
          labelText: 'Usuário',
          prefixIcon: Icon(Icons.person)),
    );

    var __passwordInput = TextFormField(
      controller: __passwordCtrl,
      validator: __inputValidation,
      decoration: InputDecoration(
          border: __inputBorder,
          isDense: false,
          labelText: 'Senha',
          prefixIcon: Icon(Icons.vpn_key)),
    );

    var __children = [__usernameInput, __spacer, __passwordInput];

    if (__errorMessage != null) {
      __children.add(Text(__errorMessage,
          style: TextStyle(color: Colors.red, height: 2.0)));
    }

    return Padding(
      padding: EdgeInsets.all(36.0),
      child: Flex(
        direction: Axis.vertical,
        children: __children,
      ),
    );
  }

  Widget buildButtonsSection() {
    var __buttonWidth = MediaQuery.of(context).size.width / 2;

    var __LoginButton = RaisedButton(
        elevation: 4.0,
        padding: EdgeInsets.all(8.0),
        onPressed: this.login,
        child: Text('Entrar'));

    return IntrinsicWidth(
      child: __LoginButton,
      stepWidth: __buttonWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    var body = Container(child: buildForm());

    return new Scaffold(body: body);
  }
}
