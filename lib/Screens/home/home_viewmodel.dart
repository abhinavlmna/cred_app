import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:cred_app/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/utils.dart';

class HomeViewModel extends BaseViewModel {
  //List<Products> plist = [];
  Future<void> loaddata() async {
    print("calling api");
    var response = await Apiclient().get('/user/list');
    response = jsonDecode(response);

    print(response.data);

    // plist = api.Loaddata();
    // notifyListeners();
  }

  final name = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();
  final place = TextEditingController();
  final address = TextEditingController();
  Future<void> submit() async {
    var UserData = {
      "name": name.text,
      "phone": phone.text,
      "age": age.text,
      "place": place.text,
      "address": address.text
    };
    // print(UserData);
    var response = await Apiclient()
        .post('/user/create', UserData)
        .then((value) => {navigationService.navigateTo(Routes.viewdetails)});
  }
}
