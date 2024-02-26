import 'package:cred_app/Screens/apiclient.dart';
import 'package:cred_app/Screens/donepg.dart';
import 'package:cred_app/Screens/home/home_view.dart';
import 'package:cred_app/Screens/viewpg.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Donepage, initial: true),
    MaterialRoute(page: Viewdetails),
  ],
  dependencies: [
    LazySingleton(classType: Apiclient),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {}
