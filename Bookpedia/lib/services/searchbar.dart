import 'package:Bookpedia/services/Pages/results.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final books = [
    'The Alchemist',
    'Think and Grow Rich',
    'As a man thinketh',
    'Power of subconcious mind'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          _sendDataToSresult(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext contexntext) {
    return IconButton(
      onPressed: () {},
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = books;
    return ListView.builder(
      itemCount: suggestionlist.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionlist[index]),
      ),
    );
  }

  void _sendDataToSresult(BuildContext context) {
    String textToSend = query;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => result(
            text: textToSend,
          ),
        ));
  }
}
