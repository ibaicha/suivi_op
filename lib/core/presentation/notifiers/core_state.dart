import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

import '../../data/model/ObjectBox/objectBoxModels.dart';
import '../../res/constants.dart';
import 'package:http/http.dart' as http;

class CoreState extends ChangeNotifier {
  CoreState() {
    _init();
  }

  _init() {}

  Future<List<SaisonObject>> getAllSaisons() async {
    var url = Uri.parse(Constants.baseUrl + Constants.allsaisons);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Constants.access}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<SaisonObject> model =
          jsonResponse.map((data) => SaisonObject.fromJson(data)).toList();
      // print(model);
      return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
