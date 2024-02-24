import 'dart:convert';

import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/donepg.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class User {
  late String name;
  late int phone;
  late int age;
  late String place;
  late String address;
  User(
      {required this.name,
      required this.phone,
      required this.age,
      required this.place,
      required this.address});
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _age = TextEditingController();
  final _place = TextEditingController();
  final _address = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _age.dispose();
    _place.dispose();
    _address.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('User details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter your name here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _phone,
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
              controller: _age,
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
              controller: _place,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Place',
                  hintText: 'Enter your place here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _address,
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
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var response = await Apiclient().get('/user/list');
                    response = jsonDecode(response);
                    print(response.data);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Viewdetails(userData: response)));
                  },
                  child: Text('View all users'),
                ),
                SizedBox(
                  width: 70,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Donepage()));
                    String name = _name.text;
                    String phone = _phone.text;
                    String age = _age.text;
                    String place = _place.text;
                    String address = _address.text;
                    var UserData = {
                      "name": name,
                      "phone": phone,
                      "age": age,
                      "place": place,
                      "address": address
                    };
                    // print(UserData);
                    var response =
                        await Apiclient().post('/user/create', UserData);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
