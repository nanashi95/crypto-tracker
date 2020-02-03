import 'package:flutter/material.dart';
import '../repository/crypto_repository.dart';
import '../models/Assets.dart';
import '../widgets/asset_tile.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Asset> _assets = <Asset>[];

  @override
  void initState() {
    super.initState();
    listenForAssets();
  }


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('チャート'),
        ),
        body: ListView.builder(
          itemCount: _assets.length,
          itemBuilder: (context, index) => AssetTile(_assets[index]),
        ),
      );

  void listenForAssets() async {
    final List<Asset> stream = await fetchAssets();
        setState(() =>  _assets = stream);
  }
}