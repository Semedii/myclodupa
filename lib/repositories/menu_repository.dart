import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mycloudpa/model/menu_item.dart';


class MenuRepository {
  Future<List<MenuItem>> fetchMenu() async {
    final String jsonString = await rootBundle.loadString('assets/menu_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((model) => MenuItem.fromJson(model)).toList();
  }
}
