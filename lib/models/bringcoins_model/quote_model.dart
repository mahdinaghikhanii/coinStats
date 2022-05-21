import 'package:hive/hive.dart';

import 'usd_model.dart';
part 'quote_model.g.dart';

@HiveType(typeId: 2)
class QuoteModel extends HiveObject {
  @HiveField(0)
  final UsdModel usdModel;

  QuoteModel({
    required this.usdModel,
  });
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      usdModel: UsdModel.fromJson(json["USD"]),
    );
  }
}
