/*
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:Bookpedia/services/searchbar.dart';
import 'package:flutter/material.dart';

class BookDetail extends DataSearch {
  String book = DataSearch().query;

  var url =
      'https://www.googleapis.com/books/v1/volumes?q=${this.book}:keyes&key=AIzaSyCZirO73lPyuENe0phd6VECWutfpKK4lkc';
  void getResults() async {
    Response res = await get(url);
    var data = jsonDecode(res.body);
  }
}

      body: ListView.builder(
        itemCount: bookresults.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(bookresults[index]['volumeInfo']),
        ),
      ),

  factory mybooks.fromJson(Map<String, dynamic> json) {
    return mybooks(items: json['items']);
*/
