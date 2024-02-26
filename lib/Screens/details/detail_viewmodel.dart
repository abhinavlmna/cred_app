import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:cred_app/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/utils.dart';

class DetailViewModel extends BaseViewModel {
  Future<void> loaddata() async {
    print("calling api");
    var response = await Apiclient().get('/user/list');
    response = jsonDecode(response);

    print(response.data);

    // plist = api.Loaddata();
    notifyListeners();
  }
}
