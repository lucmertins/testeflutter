import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsDetail extends StatelessWidget {
  final Set<WordPair> _saved;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  RandomWordsDetail(this._saved);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = _saved.map(
          (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          trailing: Icon(Icons.favorite, color: Colors.lightGreen),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );  }

}