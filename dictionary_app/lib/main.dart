import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Dictionary',
      theme: ThemeData(
          // Define your theme
          ),
      home: DictionaryApp(),
    );
  }
}

class DictionaryApp extends StatefulWidget {
  @override
  _DictionaryAppState createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  final TextEditingController _wordController = TextEditingController();
  String _meaning = '';

  // Generate a set of English words using english_words package
  Set<String> englishWords =
      generateWordPairs().take(500).map((pair) => pair.first).toSet();

  void _generateMeaning() {
    String word = _wordController.text.trim();
    if (word.isNotEmpty && englishWords.contains(word.toLowerCase())) {
      setState(() {
        _meaning = 'The meaning of $word is available in the dictionary.';
      });
    } else if (word.isNotEmpty) {
      setState(() {
        _meaning =
            'The word $word is not available in the dictionary. Try another word.';
      });
    } else {
      setState(() {
        _meaning = 'Please enter a word.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Dictionary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _wordController,
              decoration: InputDecoration(
                labelText: 'Enter a word',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _generateMeaning,
              child: Text('Generate Meaning'),
            ),
            SizedBox(height: 16.0),
            Text(
              '$_meaning',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            // Add a container for a visually appealing UI element
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'Your Stunning UI Element Here',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
