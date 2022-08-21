import 'package:flutter/material.dart';
import 'package:meminder/app.dart';
import 'package:meminder/schemas/item.dart';
import 'package:realm/realm.dart';

void main() {
  Configuration config = Configuration.local([Item.schema]);
  Realm realm = Realm(config);
  MEMinderApp.realm = realm;
  runApp(const MEMinderApp());
}
