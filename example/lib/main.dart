import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable widget example app'),
        ),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            if (index == 0) {
              return ExpandableWidget(
                title: 'This is title',
                child: Text('This is body'),
              );
            }

            return ExpandableWidget(
              title: 'Header $index',
              child: _buildChildWidget(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: .5,
                  color: Colors.black26,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildChildWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
      child: Text('Lorem ipsum dolor sit amet, consectetur '
          'adipiscing elit. Duis vestibulum posuere est ut pellentesque. '
          'In bibendum urna ac tortor vehicula vehicula. Pellentesque et '
          'bibendum odio. Quisque in ex eu nunc dapibus mollis eu at nibh. '
          'Maecenas fermentum ex vitae elit egestas tempor. Fusce sit amet sem '
          'iaculis, faucibus ante et, auctor est.'),
    );
  }
}
