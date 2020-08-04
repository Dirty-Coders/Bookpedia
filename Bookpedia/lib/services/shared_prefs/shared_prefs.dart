///This dart file adds methods to the app using which a record of names being searched can be stored for future references.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  int counterForStoredData = 0;
  List listOfNames = [];

  Future<int> checkNumberOfSavedData() async {
    //this method returns 1 if the app has been used earlier else 0 for first time.
    SharedPreferences sf = await SharedPreferences.getInstance();
    if (sf.getInt('started') == null) {
      sf.setInt('started', 1);
      return 0;
    } else {
      counterForStoredData = sf.getInt('numberOfNamesStored');
      return 1;
    }
  }

  void _PrepareDataList() async {
    //this creates a list of all the names stored
    SharedPreferences sf = await SharedPreferences.getInstance();
    int check = await checkNumberOfSavedData();
    int localCounter = 0;
    if (check == 1) {
      int i;
      String name = "bookname";
      for (i = 0; i < counterForStoredData; i++) {
        name = 'bookname' + i.toString();
        listOfNames.add(name);
      }
    }
    List getList() {
      _PrepareDataList();
      return listOfNames;
    }

    void addData(String name) {}
  }
}
