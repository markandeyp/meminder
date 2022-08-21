import 'package:flutter/material.dart';
import 'package:meminder/drawer.dart';
import 'package:meminder/home.dart';
import 'package:realm/realm.dart';

class MEMinderApp extends StatelessWidget {
  static late Realm realm;

  const MEMinderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue.shade600),
        home: Scaffold(
          appBar: AppBar(title: const Text('MEMinder')),
          drawer: const AppDrawer(),
          body: HomeView(
            realm: realm,
          ),
        ));
  }
}
