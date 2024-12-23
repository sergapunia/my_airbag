import 'dart:developer';

import "package:http/http.dart" as http;
import 'dart:convert';

class CurseRuble {
  static Future<double?> getUsdToRubExchangeRate() async {
    final url = 'https://api.exchangerate-api.com/v4/latest/USD';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['rates']['RUB']; // Курс доллара к рублю
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