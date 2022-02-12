import 'package:dicstionary_bloc_app/Models/word_response.dart';
import 'package:dicstionary_bloc_app/Screens/Details/detail_screen.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<WordResponse> words;
  ListPage({required this.words});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(words[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(words[index].word.toString()),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
