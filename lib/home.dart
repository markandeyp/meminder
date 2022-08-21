import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'schemas/item.dart';

class HomeView extends StatefulWidget {
  final Realm realm;
  const HomeView({Key? key, required this.realm}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controller = TextEditingController();
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    RealmResults<Item> allItems = widget.realm.all<Item>();
    items = allItems.toList();
    if (kDebugMode) {
      print(allItems.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration:
                const InputDecoration(hintText: "What do you want to do?"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                final title = controller.text;

                widget.realm.write(() {
                  widget.realm.add<Item>(Item(ObjectId(), title));
                });

                setState(() {
                  items = widget.realm.all<Item>().toList();
                });

                controller.clear();
              },
              child: const Text("Add")),
          const SizedBox(height: 40),
          ...items.map((item) => Text(item.title)).toList()
        ],
      ),
    );
  }
}
