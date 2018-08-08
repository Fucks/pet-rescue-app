import 'package:flutter/material.dart';
import 'arc-banner-image.dart';

class DetailDialog extends StatelessWidget {
  var id = '00000-000';

  @override
  Widget build(BuildContext context) => new Dismissible(
        key: Key("detail-${id}"),
        direction: DismissDirection.down,
        onDismissed: (direction) => Navigator.of(context).pop(),
        child: new Card(
            margin: EdgeInsets.only(left: 26.0, top: 76.0, right: 26.0),
            child: new Column(
              children: <Widget>[
                __buildImage(context),
                __buildGeneralInfo2(context),
              ],
            )),
      );

  __buildImage(ctx) => new Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.topEnd,
          children: [
            new ArcBannerImage('images/cachorro.png'),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Encontrado há 3 dias \n por Wellington',
                  textDirection: TextDirection.rtl,
                  style:
                      Theme.of(ctx).accentTextTheme.title.merge(const TextStyle(
                            fontSize: 14.0,
                          ))),
            )
          ]);

  __buildGeneralInfo2(ctx) => new Expanded(
        child: new ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          children: <Widget>[
            new Container(
              decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(color: Colors.deepOrange))),
              child: new Text("Dados para contato",
                  style: Theme.of(ctx).textTheme.subhead),
              padding: const EdgeInsets.all(16.0),
            ),
            __buildInfoRow('Encontrado por:', 'Wellington Felipe Fucks', ctx),
            __buildInfoRow('Encontrado em:', 'Rua Carlos Drummond de Andrade\n Três Bandeiras\n 30/05/2018', ctx),
            __buildInfoRow('Descrição:', '"Tem uma mancha preta no rosto, perto da orelha esquerda e rabo cortado também."', ctx),
            __buildInfoRow('Telefone:', '45 99946-9711', ctx),
          ],
        ),
      );

  __buildInfoRow(title, value, ctx) => new Container(
    padding: const EdgeInsets.only(top: 16.0),
    child: new Column(
      children: <Widget>[
        new Text(title, style: Theme.of(ctx).textTheme.caption),
        new Text(value,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(ctx).textTheme.body1),
      ],
    ),
  );

}
