import 'dart:convert';
import 'dart:developer';
import 'package:airbag_project_new/services/shared/sharedprefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/refill_model.dart';

class RefillsSharedService {
  static Future<void> writeRefill(RefillModel value) async {
    List<Map<String, dynamic>> refills = await getRefillsAsMap();
    refills.add(value.toJson());
    await SharedprefsService.writeMapOrList(refills, "refills");
  }

  static Future<List<RefillModel>> getAllRefills() async {
    final prefs = await SharedPreferences.getInstance();
    String? refillsString = prefs.getString("refills");
    if (refillsString != null) {
      List<Map<String, dynamic>> refills =
          List<Map<String, dynamic>>.from(jsonDecode(refillsString));
      log("Получил поплнения: $refills");
      return refills.map((e) => RefillModel.fromJson(e)).toList();
    } else {
      log("Не вышло получить пополнения");
      return [];
    }
  }

  static Future<void> deleteRefill(int index) async {
    await SharedprefsService.deleteValueFromList(index, "refills");
  }

  static Future<List<Map<String, dynamic>>> getRefillsAsMap() async {
    return await getAllRefills()
        .then((refs) => refs.map((e) => e.toJson()).toList());
  }
}
