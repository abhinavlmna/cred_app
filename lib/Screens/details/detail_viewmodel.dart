import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/model/Person.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:cred_app/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/utils.dart';

class DetailViewModel extends BaseViewModel {
  List<Response>? users = [];
  Future<void> loaddata() async {
    users = await Apiclient().get('user/list') as List<Response>?;
    // plist = api.Loaddata();
    notifyListeners();
  }

  final name = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();
  final place = TextEditingController();
  final address = TextEditingController();
  // final namealert = TextEditingController();
  // final phonealert = TextEditingController();
  // final agealert = TextEditingController();
  // final placealert = TextEditingController();
  // final addressalert = TextEditingController();
  // _displayDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Edit Data'),
  //           content: Column(
  //             children: [
  //               TextField(
  //                 controller: namealert,
  //                 decoration: InputDecoration(
  //                     border: OutlineInputBorder(), hintText: 'Name'),
  //               ),
  //               TextField(
  //                 controller: phonealert,
  //                 decoration: InputDecoration(
  //                     border: OutlineInputBorder(), hintText: 'Phone number'),
  //               ),
  //               TextField(
  //                 controller: agealert,
  //                 decoration: InputDecoration(
  //                     border: OutlineInputBorder(), hintText: 'Age'),
  //               ),
  //               TextField(
  //                 controller: addressalert,
  //                 decoration: InputDecoration(
  //                     border: OutlineInputBorder(), hintText: 'Address'),
  //               ),
  //             ],
  //           ),
  //           actions: <Widget>[
  //             ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('Submit'))
  //           ],
  //         );
  // });
}
