import 'package:hive/hive.dart';

import 'quote_model.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String symbol;
  @HiveField(3)
  final String slug;
  @HiveField(4)
  final int numMarketPairs;
  @HiveField(5)
  final String dateAdded;
  @HiveField(6)
  final List<dynamic> tags;
  @HiveField(7)
  final int maxSupply;
  @HiveField(8)
  final num circulatingSupply;
  @HiveField(9)
  final num totalSupply;
  @HiveField(10)
  final int cmcRank;
  @HiveField(11)
  final String lastUpdated;
  @HiveField(12)
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
      json["tags"] as List,
      json["max_supply"] == null ? 0 : json["max_supply"] as int,
      json["circulating_supply"] as num,
      json["total_supply"] as num,
      json["cmc_rank"] as int,
      json["last_updated"] as String,
      QuoteModel.fromJson(json["quote"]),
    );
  }
}
