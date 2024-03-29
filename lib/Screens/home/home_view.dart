import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/details/detail_view.dart';
import 'package:cred_app/Screens/donepg.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:cred_app/app/app.router.dart';
import 'package:cred_app/app/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('User details'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: model.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter your name here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: model.phone,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                        hintText: 'Enter your phone number here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: model.age,
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                        hintText: 'Enter your age here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: model.place,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Place',
                        hintText: 'Enter your place here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: model.address,
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                        hintText: 'Enter your address here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 55,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            model.navv();
                            print('calling');
                            var response = await Apiclient()
                                .get('user/list')
                                .catchError((err) {
                              print(err);
                            });
                            if (response == null) return;
                            print(response) as List;
                            // print(response.data);
                          },
                          child: Text('View all users'),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var UserData = {
                              "name": model.name.text,
                              "phone": model.phone.text,
                              "age": model.age.text,
                              "place": model.place.text,
                              "address": model.address.text
                            };
                            var response = await Apiclient()
                                .post('user/create', UserData)
                                .then((value) => {
                                      navigationService
                                          .navigateTo(Routes.donepage)
                                    });
                            print('api  called');
                            model.nav2();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Donepage()));
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
        });
  }
}
