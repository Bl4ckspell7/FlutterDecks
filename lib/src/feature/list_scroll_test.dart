import 'package:flutter/material.dart';

class ListScrollTest extends StatefulWidget {
  const ListScrollTest({super.key});

  @override
  State<ListScrollTest> createState() => _ListScrollTestState();
}

class _ListScrollTestState extends State<ListScrollTest> {
  final List<int> _items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
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
