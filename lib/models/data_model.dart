import 'dart:math';

import 'package:coinstats/models/quote_model.dart';

class DataModel {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int numMarketPairs;
  final String dateAdded;
  final List<dynamic> tags;
  final int maxSupply;
  final num circulatingSupply;
  final num totalSupply;

  final int cmcRank;
  final String lastUpdated;
  final QuoteModel quoteModel;

  DataModel(
      this.id,
      this.name,
      this.symbol,
      this.slug,
      this.numMarketPairs,
      this.dateAdded,
      this.tags,
      this.maxSupply,
      this.circulatingSupply,
      this.totalSupply,
      this.cmcRank,
      this.lastUpdated,
      this.quoteModel);
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      json["id"] as int,
      json["name"] as String,
      json["symbol"] as String,
      json["slug"] as String,
      json["num_market_pairs"] as int,
      json["date_added"] as String,
      json["tags"],
      json["max_supply"] == null ? 0 : json["max_supply"] as int,
      json["circulating_supply"] as num,
      json["total_supply"] as num,
      json["cmc_rank"] as int,
      json["last_updated"] as String,
      QuoteModel.fromJson(json["quote"]),
    );
  }
}
