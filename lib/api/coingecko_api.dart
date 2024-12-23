import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class CoingeckoApi {
  static Map<String, String> cryptoIds = {
    'USD': 'usd-coin',
    'BTC': 'bitcoin',
    'ETH': 'ethereum',
    'SOL': 'solana',
    'ARB': 'arbitrum',
  };
  static Future<double?> getCryptoPrice(String cryptoId) async {
    final url =
        'https://api.coingecko.com/api/v3/simple/price?ids=${cryptoIds[cryptoId]}&vs_currencies=usd';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log("получены данные : $data");
        return data[cryptoIds[cryptoId]]['usd']
            ?.toDouble(); // Возвращаем цену в USD
      } else {
        log('Ошибка: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Произошла ошибка: $e');
      return null;
    }
  }
}
