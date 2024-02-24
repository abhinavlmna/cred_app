import 'package:flutter/material.dart';

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

class Viewdetails extends StatefulWidget {
  final Listtitle userData;

  const Viewdetails({required this.userData});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails> {
  List<Listtitle> tilelist = [
    Listtitle(
        name: 'Abhinav',
        phone: 7025911389,
        age: 20,
        place: 'kochi',
        address: 'kerala'),
    Listtitle(
        name: 'Abhinav',
        phone: 7025911389,
        age: 20,
        place: 'kochi',
        address: 'kerala'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View all users'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                Listtitle response = tilelist[index];
                return Column(
                  children: [
                    Text('${response.name}'),
                    Text('${response.phone}'),
                    Text('${response.age}'),
                    Text('${response.place}'),
                    Text('${response.address}'),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: tilelist.length,
            ),
          )
        ],
      ),
    );
  }
}
