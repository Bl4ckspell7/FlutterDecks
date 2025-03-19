import 'package:flutter/material.dart';

class ListScrollTest extends StatefulWidget {
  final int listSize;
  const ListScrollTest({super.key, required this.listSize});

  @override
  State<ListScrollTest> createState() => _ListScrollTestState();
}

class _ListScrollTestState extends State<ListScrollTest> {
  late final List<int> _items;

  @override
  void initState() {
    super.initState();
    _items = List<int>.generate(widget.listSize, (int index) => index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item ${_items[index]}'),
            onTap: () {
              setState(() {
                _items.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
