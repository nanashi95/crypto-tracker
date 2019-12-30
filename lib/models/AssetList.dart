import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Assets.dart';

class AssetList {
  final List<Asset> assets;

  AssetList({
    this.assets,
  });

  factory AssetList.fromJson(List<dynamic> parsedJson) {

    List<Asset> assets = new List<Asset>();
    assets = parsedJson.map((i)=>Asset.fromJson(i)).toList();

    return new AssetList(
      assets: assets,
    );
  }

}

Future<AssetList> fetchAssets() async {
  final response =
  await http.get('https://api.coincap.io/v2/assets');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return AssetList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load asset list');
  }
}