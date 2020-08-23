import 'package:flutter/material.dart';

class NewBookmark extends StatefulWidget {
  final Function addBx;

  NewBookmark(this.addBx);

  @override
  _NewBookmarkState createState() => _NewBookmarkState();
}

class _NewBookmarkState extends State<NewBookmark> {
  final titleController = TextEditingController();

  final urlController = TextEditingController();

  final tagController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredUrl = urlController.text;
    final enteredTag = tagController.text;

    if (enteredTitle.isEmpty || enteredUrl.isEmpty || enteredTag.isEmpty) {
      return;
    }

    widget.addBx(enteredTitle, enteredUrl, enteredTag);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Short Title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText:
                      "Url (Make sure https:// is present in the beginning"),
              controller: urlController,
              keyboardType: TextInputType.url,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "One Tag"),
              controller: tagController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add BookMark'),
              textColor: Theme.of(context).primaryColor,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
