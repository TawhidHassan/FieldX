import 'package:fieldx/Bloc/test_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Page/Home/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());
      case HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => TestCubit(),
              child: HomePage(),
            ));

      default:
        return null;
    }
  }
}
