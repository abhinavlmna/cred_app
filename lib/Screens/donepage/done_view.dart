import 'package:cred_app/Screens/login/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DoneView extends StatelessWidget {
  DoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
            body: Center(
                child: Text(
              'Done',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent),
            )),
          ));
        });
  }
}
