import 'package:flutter/material.dart';
import '../models/Assets.dart';

class AssetTile extends StatelessWidget {
  final Asset _asset;
  AssetTile(this._asset);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_asset.symbol, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(_asset.name),
        /*leading: Container(
            margin: EdgeInsets.only(left: 6.0),
            child: Image.network(_beer.image_url, height: 50.0, fit: BoxFit.fill,)
        ),*/
      ),
      Divider()
    ],
  );
}