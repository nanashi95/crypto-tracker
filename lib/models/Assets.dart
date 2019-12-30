// To parse this JSON data, do
//
//     final asset = assetFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;


Asset assetFromJson(String str) => Asset.fromJson(json.decode(str));

String assetToJson(Asset data) => json.encode(data.toJson());

class Asset {
  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  String priceUsd;
  String changePercent24Hr;
  String vwap24Hr;

  Asset({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
    id: json["id"],
    rank: json["rank"],
    symbol: json["symbol"],
    name: json["name"],
    supply: json["supply"],
    maxSupply: json["maxSupply"],
    marketCapUsd: json["marketCapUsd"],
    volumeUsd24Hr: json["volumeUsd24Hr"],
    priceUsd: json["priceUsd"],
    changePercent24Hr: json["changePercent24Hr"],
    vwap24Hr: json["vwap24Hr"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rank": rank,
    "symbol": symbol,
    "name": name,
    "supply": supply,
    "maxSupply": maxSupply,
    "marketCapUsd": marketCapUsd,
    "volumeUsd24Hr": volumeUsd24Hr,
    "priceUsd": priceUsd,
    "changePercent24Hr": changePercent24Hr,
    "vwap24Hr": vwap24Hr,
  };
}

Future<Asset> fetchAssets() async {
  final response =
  await http.get('https://api.coincap.io/v2/assets');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Asset.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load asset');
  }
}
