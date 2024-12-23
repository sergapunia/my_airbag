class RefillModel {
  late String tokenName;
  late double countToken;
  late double countFiat;
  late String nameFiat;
  late double byPriceToken;
  late double realPriceToken;
  late String date;
  late double spread;
  late double fiatPrice;
  RefillModel({
    required this.realPriceToken,
    required this.date,
    required this.nameFiat,
    required this.tokenName,
    required this.countToken,
    required this.countFiat,
    required this.byPriceToken,
    required this.spread,
    required this.fiatPrice,
  });

  RefillModel.fromJson(Map<String, dynamic> json) {
    fiatPrice = json["fiatPrice"] ?? 0;
    realPriceToken = json["realPriceToken"] ?? 0;
    date = json["date"] ?? "";
    nameFiat = json["nameFiat"] ?? "";
    tokenName = json["tokenName"] ?? "";
    countToken = json["countToken"] ?? 0;
    countFiat = json["countFiat"] ?? 0;
    byPriceToken = json["priceToken"] ?? 0;
    spread = json["spread"] ?? 0;
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["fiatPrice"] = fiatPrice;
    data["spread"] = spread;
    data["realPriceToken"] = realPriceToken;
    data["date"] = date;
    data["nameFiat"] = nameFiat;
    data["tokenName"] = tokenName;
    data["countToken"] = countToken;
    data["countFiat"] = countFiat;
    data["priceToken"] = byPriceToken;
    // spread = (realPriceToken - byPriceToken) / byPriceToken * 100;
    return data;
  }
}
