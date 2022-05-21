import 'package:hive/hive.dart';

part 'usd_model.g.dart';

@HiveType(typeId: 1)
class UsdModel extends HiveObject {
  @HiveField(0)
  final num price;
  @HiveField(1)
  final num volume24h;
  @HiveField(2)
  final num percentChange_1h;
  @HiveField(3)
  final num percentChange_24h;
  @HiveField(4)
  final num percentChange_7d;
  @HiveField(5)
  final num percentChange_30d;
  @HiveField(6)
  final num percentChange_60d;
  @HiveField(7)
  final num percentChange_90d;
  @HiveField(8)
  final num marketCap;
  @HiveField(9)
  final String lastUpdated;
  @HiveField(10)
  final num fullydilutedmarketcap;

  UsdModel(
      {required this.price,
      required this.volume24h,
      required this.percentChange_1h,
      required this.percentChange_24h,
      required this.percentChange_7d,
      required this.percentChange_30d,
      required this.percentChange_60d,
      required this.percentChange_90d,
      required this.marketCap,
      required this.lastUpdated,
      required this.fullydilutedmarketcap});

  factory UsdModel.fromJson(Map<String, dynamic> json) {
    return UsdModel(
      // ignore: prefer_if_null_operators
      price: json["price"] == null ? 0.0 : json["price"],
      volume24h: json["volume_24"] ?? 0.0,
      percentChange_1h: json["percent_change_1h"] ?? 0.0,
      percentChange_24h: json["percent_change_24h"] ?? 0.0,
      percentChange_7d: json["percent_change_7d"] ?? 0.0,
      percentChange_30d:
          json["percent_change_30d"] == null ? 0.0 : json["percent_change_7d"],
      percentChange_60d: json["percent_change60d"] ?? 0.0,
      percentChange_90d: json["percent_change90d"] ?? 0.0,
      marketCap: json["market_cap"] ?? 0.0,
      lastUpdated: json["last_updated"],
      fullydilutedmarketcap: json["fully_diluted_market_cap"],
    );
  }
}
