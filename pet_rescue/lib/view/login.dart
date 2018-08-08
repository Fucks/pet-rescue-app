import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  var username, password;

  final _usernameCtrl = new TextEditingController();
  final _passwordCtrl = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void login() {
    if (_formKey.currentState.validate()) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _passwordCtrl.dispose();
    _usernameCtrl.dispose();
    super.dispose();
  }

  Widget getFormLogin() {
    var textTheme = Theme.of(context).accentTextTheme;

    return new Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: new Form(
            key: _formKey,
            child: new Column(children: <Widget>[
              new TextFormField(
                  controller: _usernameCtrl,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      isDense: true,
                      prefixIcon: new Icon(Icons.person),
                      labelText: 'Usuário'),
                  validator: (value) {
                    if (value.isEmpty) return 'Informe o nome de usuário';
                  }),
              new Divider(
                height: 16.0,
                color: Colors.transparent,
              ),
              new TextFormField(
                controller: _passwordCtrl,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    isDense: true,
                    prefixIcon: new Icon(Icons.vpn_key),
                    labelText: 'Senha'),
                validator: (value) {
                  if (value.isEmpty) return 'Informe a senha';
                },
              ),
              new Flex(
                direction: Axis.vertical,
                children: [
                  new Divider(
                    height: 16.0,
                    color: Colors.transparent,
                  ),
                  new RaisedButton(
                    onPressed: this.login,
                    child: new Text('Entrar'),
                  )
                ],
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    var body = new Container(
        padding: EdgeInsets.all(36.0),
        child: new Center(
            child: new SingleChildScrollView(child: getFormLogin())));

    return new Scaffold(body: body);
  }
}
