import 'dart:developer';

import 'package:airbag_project_new/models/refill_model.dart';

import '../api/curse_ruble.dart';
import 'calculate_service.dart';

class TokensService {
  static Future<RefillModel> createRefill({
    required String fiatSymbol,
    required String tokenSymbol,
    required double countFiat,
    required double byPrice,
  }) async {
    double fiatPrice = await CurseRuble.getUsdToRubExchangeRate() ?? 0;
    log("Курс бакса к рублю: $fiatPrice");
    double realPrice = await CalculateService.getCurrentPriceToken(tokenSymbol);
    double? dollars;
    if (fiatSymbol == "RUB" && tokenSymbol != "USD") {
      dollars = countFiat / await CalculateService.convertToRuble(countFiat);
      log("количество в баксах: $dollars");
    }
    return RefillModel(
      fiatPrice: fiatPrice,
      realPriceToken: realPrice,
      date: DateTime.now().millisecondsSinceEpoch.toString(),
      nameFiat: fiatSymbol,
      tokenName: tokenSymbol,
      countToken:
          CalculateService.calculateCountToken(dollars ?? countFiat, byPrice),
      countFiat: countFiat,
      byPriceToken: byPrice,
      spread: CalculateService.calculateSpread(byPrice, realPrice),
    );
  }
}
