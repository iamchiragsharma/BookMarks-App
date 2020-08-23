import 'package:flutter/material.dart';

import './models/new_bookmark.dart';
import './models/bookmark.dart';
import './models/bookmark_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'ProximaNova',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Bookmark> _userBookmark = [
  ];

  void _addNewBookmark(String bxTitle, String bxUrl, String bxTag) {
    final newBx = Bookmark(
      tag: bxTag,
      title: bxTitle,
      url: bxUrl,
      date: DateTime.now(),
    );

    setState(() {
      _userBookmark.add(newBx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewBookmark(_addNewBookmark);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMarks App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BookmarkList(_userBookmark),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
