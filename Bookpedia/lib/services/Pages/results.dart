import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:core';

class result extends StatefulWidget {
  final String text;

  result({Key key, @required this.text}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
  Map mymap;
  List a;
  List<String> bookresults = [];

  @override
  void initState() {
    super.initState();
    getResults();
  }

  void getResults() async {
    Response res = await get(
        Uri.encodeFull(
            'https://www.googleapis.com/books/v1/volumes?q=${widget.text}:keyes&key=AIzaSyCZirO73lPyuENe0phd6VECWutfpKK4lkc'),
        headers: {
          'key': 'AIzaSyCZirO73lPyuENe0phd6VECWutfpKK4lkc',
          'Accept': 'application/json'
        });
    var data = jsonDecode(res.body);
    a = data['items'];
    for (int i = 1; i < 10; i++) {
      mymap = a[i]['volumeInfo'];
      String s = mymap['title'].toString();
      bookresults.add(s);
    }
    setState(() {});
    print(bookresults);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for ${widget.text}'),
      ),
      body: bookresults == []
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: bookresults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(bookresults[index]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
