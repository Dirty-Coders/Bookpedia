import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:Bookpedia/services/searchbar.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String book = DataSearch().query;

  // var url =
  //     'https://www.googleapis.com/books/v1/volumes?q=${book}:keyes&key=AIzaSyCZirO73lPyuENe0phd6VECWutfpKK4lkc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Books'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
