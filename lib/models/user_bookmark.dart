import 'package:flutter/material.dart';
import './new_bookmark.dart';
import './bookmark_list.dart';
import '../models/bookmark.dart';

class UserBookmark extends StatefulWidget {
  @override
  _UserBookmarkState createState() => _UserBookmarkState();
}

class _UserBookmarkState extends State<UserBookmark> {
  final List<Bookmark> _userBookmark = [
    Bookmark(
      tag: 'tag1',
      title: 'Google',
      url: 'www.google.com',
      date: DateTime.now(),
    ),
    Bookmark(
      tag: 'tag2',
      title: 'Google',
      url: 'www.google.com',
      date: DateTime.now(),
    ),
    Bookmark(
      tag: 'tag3',
      title: 'Google',
      url: 'www.google.com',
      date: DateTime.now(),
    ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewBookmark(_addNewBookmark),
        BookmarkList(_userBookmark),
      ],
    );
  }
}
