import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/details/detail_viewmodel.dart';
import 'package:cred_app/Screens/donepg.dart';
import 'package:cred_app/Screens/model/Person.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';

import 'detail_view.dart';

class DetailView extends StatefulWidget {
  DetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DetailView> {
  final namealert = TextEditingController();
  final phonealert = TextEditingController();
  final agealert = TextEditingController();
  final placealert = TextEditingController();
  final addressalert = TextEditingController();
  _displayDialog(BuildContext context, Response s) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Data'),
            content: Column(
              children: [
                TextField(
                  controller: namealert,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                TextField(
                  controller: phonealert,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phonenumber',
                  ),
                ),
                TextField(
                  controller: agealert,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Age',
                  ),
                ),
                TextField(
                  controller: addressalert,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Address',
                  ),
                )
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () async {
                    var response = await Apiclient().put('user/edit', {
                      "userId": '${s.id}',
                      "name": namealert.text,
                      "phone": phonealert.text,
                      "age": agealert.text,
                      "place": placealert.text,
                      "address": addressalert.text
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
        viewModelBuilder: () => DetailViewModel(),
        onViewModelReady: (model) {
          model.loaddata();
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('View all users'),
              backgroundColor: Color.fromARGB(255, 181, 105, 240),
            ),
            body: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Response response = model.users![index];
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      Text('${response.name}'),
                      Text('${response.phone}'),
                      Text('${response.age}'),
                      Text('${response.place}'),
                      Text('${response.address}'),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  Response response = model.users![index];
                                  var userId = response.id;
                                  print(userId);
                                  _displayDialog(context, response);
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () async {
                                  Response response = model.users![index];
                                  var r = await Apiclient().delete(
                                      'user/delete', {
                                    "userId": response.id
                                  }).catchError((err) {
                                    print(err);
                                  });
                                  var rr = await Apiclient()
                                      .get('user/list')
                                      .catchError((err) {
                                    print(err);
                                  });
                                  if (r == null) return;
                                  print(response) as List;
                                  // debugPrint('successful');
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: model.users!.length,
            ),
          );
        });
  }
}
