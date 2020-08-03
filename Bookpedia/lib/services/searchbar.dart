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
    print("buildAction performed");
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
    print("buildLeading performed");
    return IconButton(
      onPressed: () {},
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print("buildResults performed");
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("buildSuggestions performed");
    final suggestionlist = books;
    return ListView.builder(
      itemCount: suggestionlist.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionlist[index]),
      ),
    );
  }

  void _sendDataToSresult(BuildContext context) {
    print("_sendDataToSresult performed");
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
