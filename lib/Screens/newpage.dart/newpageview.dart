import 'package:cred_app/Screens/newpage.dart/newpageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewPageView extends StatelessWidget {
  NewPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewPageViewModel>.reactive(
        viewModelBuilder: () => NewPageViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold();
        });
  }
}
