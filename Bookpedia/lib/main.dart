import 'package:Bookpedia/services/Pages/results.dart';

/// To do- Link the Search word to the api call

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
  String nameEntered;
  bool colorEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 173, 207, 81),
        title: Text('Search Books'),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                cursorColor: Color.fromRGBO(0, 173, 207, 81),
                decoration: InputDecoration(
                  hintText: "Input the name of the book",
                ),
                onChanged: (nameEntered) {
                  setState(() {
                    this.nameEntered = nameEntered;
                    colorEdit = !colorEdit;
                  });
                },

                ///This is the method where all operations on the name given by the user is supposed to be worked on.
                ///{$nameEntered} is the variable in which the name entered would be stored.
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: AnimatedContainer(
                  width: 500,
                  color: colorEdit
                      ? Color.fromRGBO(0, 173, 207, 81)
                      : Colors.amber,
                  duration: Duration(milliseconds: 500),
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print("Name entered by the user is $nameEntered");
                        _sendDataToSresult(context);
                      }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _sendDataToSresult(BuildContext context) {
    print("_sendDataToSresult performed");
    String textToSend = nameEntered;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => result(
            text: textToSend,
          ),
        ));
  }
}
