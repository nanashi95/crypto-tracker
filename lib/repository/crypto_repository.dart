import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Assets.dart';

const String getAssetListString = 'https://api.coincap.io/v2/assets';

Future<List<Asset>> fetchAssets() async {
  final client = new http.Client();
  final response =
  await client.get(getAssetListString);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return parseAssets(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load asset');
  }
}

List<Asset> parseAssets(String responseBody) {
  final jsonResponse = json.decode(responseBody);
  Assets assets = new Assets.fromJson(jsonResponse);
  return assets.getAssets();
}