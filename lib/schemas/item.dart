import 'package:realm/realm.dart';
part 'item.g.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String title;
}
