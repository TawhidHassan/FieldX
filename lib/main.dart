// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:fieldx/Bloc/test_cubit.dart';
import 'package:fieldx/Route/app_router.dart';
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  HydratedBloc.storage=await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
   const MyApp({Key? key,  required this.router}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TestCubit>(
          create: (context) => TestCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch:Colors.deepOrange,
          // primaryColor: Color.fromARGB(255, 133, 4, 224),
        ),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}

