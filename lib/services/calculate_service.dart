import 'dart:developer';

import 'package:airbag_project_new/api/coingecko_api.dart';

import '../api/curse_ruble.dart';

class CalculateService {
  static double calculateSpread(double realPrice, double byPrice) {
    return (realPrice - byPrice) / byPrice * 100;
  }

  static double calculateCountToken(double countFiat, double byPrice) {
    return countFiat / byPrice;
  }

  static double calculateSummSellDollars(
      double totalFiat, double priceFiat, double tokenPrice) {
    return (totalFiat / priceFiat) / tokenPrice;
  }

  static Future<double> getCurrentPriceToken(String symbol) async {
    if (symbol == "USD") {
      double price = await CurseRuble.getUsdToRubExchangeRate() ?? 0;
      log("Цена бакса: $price p");
      return price;
    } else {
      double price = await CoingeckoApi.getCryptoPrice(symbol) ?? 0;
      log("Цена токена: $price \$");
      return price;
    }
  }

  static Future<double> convertToRuble(double countDollars) async {
    double? curse = await CurseRuble.getUsdToRubExchangeRate();
    if (curse != null) {
      return countDollars * curse;
    } else {
      return 0;
    }
  }
}
