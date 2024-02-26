import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/details/detail_viewmodel.dart';
import 'package:cred_app/Screens/donepg.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';

import 'detail_view.dart';

class Listtitle {
  late String name;
  late int phone;
  late int age;
  late String place;
  late String address;
  Listtitle(
      {required this.name,
      required this.phone,
      required this.age,
      required this.place,
      required this.address});
}

class DetailView extends StatefulWidget {
  DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DetailView> {
  List<Listtitle> tilelist = [
    // Listtitle(
    //     name: 'Abhinav',
    //     phone: 7025911389,
    //     age: 20,
    //     place: 'kochi',
    //     address: 'kerala'),
    // Listtitle(
    //     name: 'Abhinav',
    //     phone: 7025911389,
    //     age: 20,
    //     place: 'kochi',
    //     address: 'kerala'),
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
        viewModelBuilder: () => DetailViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('View all users'),
              backgroundColor: Colors.greenAccent,
            ),
            body: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Listtitle response = tilelist[index];
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      Text('${response.name}'),
                      Text('${response.phone}'),
                      Text('${response.age}'),
                      Text('${response.place}'),
                      Text('${response.address}'),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: tilelist.length,
            ),
          );
        });
  }
}
