import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final double words;
  final double wordlenght;
  final double tries;

  GameScreen({
    required this.words,
    required this.wordlenght,
    required this.tries,
  });

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> wordList = [];
  int currentWordIndex = 0;
  int triesLeft = 0;
  String currentWord = '';
  String? selectedOption;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    wordList = _generateWordList();
    triesLeft = widget.tries.toInt();
    _loadNextWord();
  }

  List<String> _generateWordList() {
    List<String> words = [];

    if (widget.wordlenght == 6) {
      words = [
        'example',
        'blank',
        'option',
        'alphabet',
        'correct',
        'submit',
      ];
    } else if (widget.wordlenght == 3) {
      words = [
        'cat',
        'dog',
        'sun',
        'car',
        'red',
        'pen',
      ];
    } else if (widget.wordlenght == 9) {
      words = [
        'football',
        'chocolate',
        'elephant',
        'university',
        'waterfall',
        'basketball',
      ];
    }

    return words;
  }

  void _loadNextWord() {
    if (currentWordIndex < widget.words.toInt()) {
      currentWord = wordList[currentWordIndex];
      selectedOption = null;
      showResult = false;
    } else {
      // All words have been completed
      // You can show the final result here
      print("Game Over!");
      return;
    }
  }

  void _checkAnswer() {
    if (selectedOption != null) {
      String missingAlphabet = currentWord[currentWord.indexOf('_')];
      if (selectedOption == missingAlphabet) {
        // Correct answer
        setState(() {
          showResult = true;
        });
      } else {
        // Incorrect answer
        setState(() {
          triesLeft--;
          showResult = true;
        });
      }
    }
  }

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  Widget _buildOptions() {
    List<String> options = currentWord
        .split('')
        .where((element) => element != '_')
        .toList();

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options
          .map(
            (option) => ElevatedButton(
          onPressed: () {
            _selectOption(option);
          },
          child: Text(option),
          style: ElevatedButton.styleFrom(
            primary:
            selectedOption == option ? Colors.green : Colors.blue,
          ),
        ),
      )
          .toList(),
    );
  }

  Widget _buildWordDisplay() {
    return Column(
      children: [
        Text(
          currentWord,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        _buildOptions(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _checkAnswer,
          child: Text('Submit'),
        ),
        SizedBox(height: 20),
        Text('Tries left: $triesLeft'),
        showResult
            ? Text(
          selectedOption == currentWord[currentWord.indexOf('_')]
              ? 'Correct!'
              : 'Incorrect!',
        )
            : SizedBox(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              currentWordIndex++;
              _loadNextWord();
            });
          },
          child: Text('Next'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: _buildWordDisplay(),
        ),
      ),
    );
  }
}
