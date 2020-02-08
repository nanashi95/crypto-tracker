import 'package:flutter/material.dart';
import '../models/Assets.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';



class AssetTile extends StatelessWidget {
  final Asset _asset;
  final formatter = new NumberFormat("##.##");
  AssetTile(this._asset);

  @override
  Widget build(BuildContext context) => Container(
    //padding: EdgeInsets.all(15),
    child: Column(
    children: <Widget>[
      Container(
          padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Image.asset('lib/images/assets_icons/${_asset.symbol}.png', height: 50.0, fit: BoxFit.fill),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_asset.symbol, style: TextStyle(fontSize: 20)),
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(_asset.name)
                )
              ],
            ),
          )
        ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(FlutterMoneyFormatter(
                        amount: double.parse(_asset.priceUsd)
                    ).output.symbolOnLeft, style: TextStyle(fontSize: 20)),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: getChangePercent24Hr(_asset.changePercent24Hr)
                    )
                  ],
                ),
              )
          )
        ])
      ), Divider()
      /*ListTile(
        leading: Image.asset('lib/images/assets_icons/${_asset.symbol}.png'),
        title: Text(_asset.symbol, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(_asset.name),
        trailing: Column(
          children: <Widget>[
            Text(FlutterMoneyFormatter(
                amount: double.parse(_asset.priceUsd)
            ).output.symbolOnLeft)
          ],
        )
        /*leading: Container(
            margin: EdgeInsets.only(left: 6.0),
            child: Image.network(_beer.image_url, height: 50.0, fit: BoxFit.fill,)
        ),*/
      ),*/
      ],
    ),
  );

  Widget getChangePercent24Hr(String percentage24hr)
  {
    double percentage = double.parse(percentage24hr);
    if(percentage.isNegative){
      return Text('${formatter.format(percentage)}%', style: TextStyle(color: Colors.red));
    }

    return Text('${formatter.format(percentage)}%', style: TextStyle(color: Colors.green));
  }
}