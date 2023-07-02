import 'package:flutter/material.dart';
import 'main.dart';

class GameScreen extends StatefulWidget {
  final double wordlenght;
  final double words;
  final double tries;
  double triesstart = 0;

  GameScreen({required this.wordlenght, required this.words, required this.tries});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> questions = [];
  List<List<String>> answerOptions = [];
  List<String> correctAnswers = [];
  int currentQuestionIndex = 0;
  int correctCount = 0;
  int wrongCount = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestionsAndAnswers();
  }

  void _loadQuestionsAndAnswers() {
    if (widget.wordlenght == 6) {
      questions = [
        'Marv_l',
        'Fr_end',
        'Purpl_',
        'B_nana',
        'G_rden',
        '_andle',
        'Plan_t',
        'Doc_or',
        'Tu_tle',
        'Circl_',
      ];
      answerOptions = [
        ['k', 'e', 'z'],
        ['k', 'w', 'i'],
        ['e', 'm', 'l'],
        ['e', 'q', 'a'],
        ['y', 'a', 'o'],
        ['x', 'h', 't'],
        ['k', 'e', 'z'],
        ['t', 'k', 'w'],
        ['b', 'v', 'r'],
        ['l', 'd', 'e'],
      ];
      correctAnswers = ['e', 'i', 'e','a','a','h','e','t','r','e'];
    } else if (widget.wordlenght == 3) {
      questions = [
        '_at',
        '_og',
        '_un',
        '_ar',
        '_ed',
        '_en',
        '_un',
        '_oy',
        '_oy',
        '_ce',
      ];
      answerOptions = [
        ['n', 'w', 'c'],
        ['k', 'u', 'd'],
        ['s', 'x', 'z'],
        ['a', 'c', 'f'],
        ['r', 'b', 'h'],
        ['c', 'k', 'p'],
        ['e', 'r', 'i'],
        ['b', 'd', 'g'],
        ['r', 'j', 't'],
        ['i', 'q', 'u'],
      ];
      correctAnswers = ['c', 'd', 's','c','b','p','r','b','t','i'];
    } else if (widget.wordlenght == 9) {
      questions = [
        'Chocol_te',
        'Eleph_nt',
        'Butt_rfly',
        'Advent_re',
        'Be_utiful',
        'Educ_tion',
        'H_ppiness',
        'Sunflow_r',
        'P_radise',
        'Cre_tive',
      ];
      answerOptions = [
        ['n', 'w', 'a'],
        ['a', 'u', 'd'],
        ['e', 'x', 'z'],
        ['a', 'u', 'f'],
        ['r', 'a', 'h'],
        ['c', 'k', 'a'],
        ['a', 'r', 'i'],
        ['b', 'd', 'e'],
        ['r', 'j', 'a'],
        ['i', 'a', 'u'],
      ];
      correctAnswers = ['a', 'a', 'e','u','a','a','a','e','a','a'];
    }
  }

  void _checkAnswer(String selectedOption) {
    if (selectedOption == correctAnswers[currentQuestionIndex]) {
      setState(() {
        correctCount++;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Correct!'),
            content: Text('You selected the right option: $selectedOption'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _loadNextQuestion();
                },
                child: Text('Next Question'),
              ),
            ],
          ),
        );
      });
    } else {
      setState(() {
        wrongCount++;
        if (wrongCount >= widget.tries) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Wrong!'),
              content: Text('You selected the wrong option: $selectedOption\n'
                  'No more retries left.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _loadNextQuestion();
                  },
                  child: Text('Next Question'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Wrong!'),
              content: Text('You selected the wrong option: $selectedOption\n'
                  'Retries left: ${widget.tries - wrongCount}'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  void _loadNextQuestion() {
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex >= widget.words) {
        // All questions have been answered
        _showResult();
      }
    });
  }

  void _showResult() {
    double totalquestions=widget.words;
    if (correctCount >= widget.words - correctCount) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('You won'),
            content: Text('Correct Answers: $correctCount''/$totalquestions'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Questions list completed\nGenerate game again'),
              ),
            ],
          );
        },
      );
    }
    else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('You lost'),
            content: Text('Correct Answers: $correctCount''/$totalquestions'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Questions list completed\nGenerate game again'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: answerOptions[currentQuestionIndex]
                  .map(
                    (option) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _checkAnswer(option);
                    },
                    child: Text(option),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
