import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import './bookmark.dart';
import '../models/bookmark.dart';

class BookmarkList extends StatelessWidget {
  final List<Bookmark> bookmarks;

  BookmarkList(this.bookmarks);

  _launchURL(launchUrl) async {
    final url = launchUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Expanded(
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: FlatButton(
                        padding: EdgeInsets.all(8),
                        onPressed: () {
                          _launchURL(bookmarks[index].url);
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          bookmarks[index].tag,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Share.share(
                                "Hey Checkout this awesome url ${bookmarks[index].title} : ${bookmarks[index].url}");
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    bookmarks[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  child: Text(
                                    DateFormat.yMMMd()
                                        .format(bookmarks[index].date),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 280,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            bookmarks[index].url,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: bookmarks.length,
        ));
  }
}
