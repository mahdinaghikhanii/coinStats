import 'package:dio/dio.dart';

import '../models/bringcoins_model/big_data_modele.dart';

class Repository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "b2b16382-b6d8-4e95-a5d2-1ac4833f44c2";
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';

  final Dio _dio = Dio();
  Future<BigDataModele> getCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListingAPI);

      return BigDataModele.fromJson(response.data);
    } catch (error, stackTrace) {
      // ignore: avoid_print
      print("this is Your Eror : $error      , dd $stackTrace");
      return BigDataModele.withError("error");
    }
  }
}
