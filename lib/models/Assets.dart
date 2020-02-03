// To parse this JSON data, do
//
//     final asset = assetFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

class Assets {

  int timestamp;
  List<Asset> data;

  Assets({this.timestamp,
    this.data});

  factory Assets.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'] as List;
    List<Asset> data = list.map((i) => Asset.fromJson(i)).toList();


    return Assets(
        timestamp: parsedJson['timestamp'],
        data: data

    );
  }

  List<Asset> getAssets(){
    return this.data;
  }

}

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

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id:json["id"],
      rank: json["rank"],
      symbol: json["symbol"],
      name: json["name"],
      supply: json["supply"],
      maxSupply: json["maxSupply"],
      marketCapUsd: json["marketCapUsd"],
      volumeUsd24Hr: json["volumeUsd24Hr"],
      priceUsd: json["priceUsd"],
      changePercent24Hr: json["changePercent24Hr"],
      vwap24Hr: json["vwap24Hr"]
    );
  }
}
