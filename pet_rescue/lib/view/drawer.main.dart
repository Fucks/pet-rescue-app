import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  DefaultState createState() => new DefaultState();
}

class DefaultState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) => new Drawer(
          child: new ListView(
        padding: EdgeInsets.zero,
        children: [
          new UserAccountsDrawerHeader(
              accountName: new Text('Nome de usuário'),
              accountEmail: new Text('email@email.com'),
              currentAccountPicture: Image.asset('images/user.png')),
          new ListTile(
            title: new Text('Navegação 1'),
            onTap: () => Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('Navegação 1'),
                )),
          ),
          new Divider(height: 0.0),
          new ListTile(
              title: new Text('Navegação 2'),
              onTap: () => Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text('Navegação 2'),
                  ))),
          new Divider(height: 0.0)
        ],
      ));
}

class _UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
        padding: new EdgeInsets.all(36.0),
        child: new Center(
          child: new Column(
            children: [
              new Image(image: new AssetImage('images/cancel.png')),
              new Text('Usuário')
            ],
          ),
        ),
      );
}
