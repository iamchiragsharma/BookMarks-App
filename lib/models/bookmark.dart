import 'package:flutter/foundation.dart';

class Bookmark {
  final String title;
  final String url;
  final String tag;
  final DateTime date;

  Bookmark(
      {@required this.title,
      @required this.url,
      @required this.tag,
      @required this.date});
}
