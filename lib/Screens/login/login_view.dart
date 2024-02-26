import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return SafeArea(child: Scaffold());
        });
  }
}
