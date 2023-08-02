import 'dart:convert';

import 'package:flutter/material.dart';

import 'main.dart';

class Bartender {
  Bartender({
    required this.btName,
    required this.btMbti,
    required this.btAge,
    required this.btAdvantage,
    required this.btBlog,
    required this.btStyle,
  });
  String btName;
  String btMbti;
  String btAge;
  String btAdvantage;
  String btBlog;
  String btStyle;

  Map toJson() {
    return {
      'btName': btName,
      'btMbti': btMbti,
      'btAge': btAge,
      'btAdvantage': btAdvantage,
      'btBlog': btBlog,
      'btStyle': btStyle,
    };
  }

  factory Bartender.fromJson(json) {
    return Bartender(
      btName: json['btName'],
      btMbti: json['btMbti'],
      btAge: json['btAge'],
      btAdvantage: json['btAdvantage'],
      btBlog: json['btBlog'],
      btStyle: json['btStyle'],
    );
  }
}

class BartenderService extends ChangeNotifier {
  BartenderService() {
    loadBartender();
  }

  List<Bartender> btList = [];

  createItem(
      {required String btName,
      required String btMbti,
      required String btAge,
      required String btAdvantage,
      required String btBlog,
      required String btStyle}) {
    btList.add(
      Bartender(
        btName: btName,
        btMbti: btMbti,
        btAge: btAge,
        btAdvantage: btAdvantage,
        btBlog: btBlog,
        btStyle: btStyle,
      ),
    );
    notifyListeners(); //Consumer<BartenderService>의 builder 부분을 호출해서 화면 새로고침
    saveBartender();
  }

  updateItem({
    required int index,
    required String btName,
    required String btMbti,
    required String btAge,
    required String btAdvantage,
    required String btBlog,
    required String btStyle,
  }) {
    btList[index].btName = btName;
    btList[index].btMbti = btMbti;
    btList[index].btAge = btAge;
    btList[index].btBlog = btBlog;
    btList[index].btStyle = btStyle;
    btList[index].btAdvantage = btAdvantage;
    notifyListeners();
    saveBartender();
  }

  removeItem({required int index}) {
    btList.removeAt(index);
    notifyListeners();
    saveBartender();
  }

  saveBartender() {
    List bartenderJsonList =
        btList.map((bartender) => bartender.toJson()).toList();

    String jsonString = jsonEncode(bartenderJsonList);

    prefs.setString('btList', jsonString);
  }

  loadBartender() {
    String? jsonString = prefs.getString('btList');

    if (jsonString == null) return;

    List bartenderJsonList = jsonDecode(jsonString);

    btList = bartenderJsonList.map((json) => Bartender.fromJson(json)).toList();
  }
}
