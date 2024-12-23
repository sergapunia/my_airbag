import 'dart:convert';
import 'dart:developer';

import 'package:airbag_project_new/models/refill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefsService {
  

  static Future<void> writeMapOrList(dynamic value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    String valueString = jsonEncode(value);
    prefs.setString(key, valueString);
  }

  static Future<void> deleteValueFromList(int index,String key)async{
    final prefs = await SharedPreferences.getInstance();
    try{
      String? value = prefs.getString(key);
      if(value!=null){
        List<dynamic> listValue = jsonDecode(value);
        listValue.removeAt(index);
        await writeMapOrList(listValue, key);
      }
    }catch(e){
      log("Ошибка удаления из списка");
    }
  }
  
}
