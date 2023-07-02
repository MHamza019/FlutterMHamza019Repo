import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _currentSliderValue = 1;
  double _currentSliderValue2 = 1;
  bool _floatingbuttonpressed = false;
  double selectednumber=1;

  void _onSliderChanged(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }
  void _onSliderChanged2(double value) {
    setState(() {
      _currentSliderValue2 = value;
    });
  }

  void _onSliderChangedEnd(double value) {
    print('Selected number: $_currentSliderValue');

  }
  void _onSliderChangedEnd2(double value) {
    print('Selected number 2: $_currentSliderValue2');

  }
  void onfloatingbuttonpressed() {
    setState(() {
      _floatingbuttonpressed = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen(
        words: _currentSliderValue,
        wordlenght: selectednumber,
        tries: _currentSliderValue2,)),
    );
  }
  void _onNumberButtonPressed(double number) {
    setState(() {
      selectednumber = number;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Like Hangman Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NumberButton(
            number: '6',
            onPressed: () => _onNumberButtonPressed(6),
          ),
          NumberButton(
            number: '3',
            onPressed: () => _onNumberButtonPressed(3),
          ),
          NumberButton(
            number: '9',
            onPressed: () => _onNumberButtonPressed(9),
          ),
        ],
      ),
          SizedBox(height: 20),
          Slider(
            value: _currentSliderValue,
            min: 1,
            max: 10,
            divisions: 9,
            onChanged: _onSliderChanged,
            onChangeEnd: _onSliderChangedEnd,
          ),
          SizedBox(height: 20),
          Text(
            'Number of words: ${_currentSliderValue.toInt()}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Slider(
            value: _currentSliderValue2,
            min: 1,
            max: 10,
            divisions: 9,
            onChanged: _onSliderChanged2,
            onChangeEnd: _onSliderChangedEnd2,
          ),
          SizedBox(height: 20),
          Text(
            'Number of tries: ${_currentSliderValue2.toInt()}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onfloatingbuttonpressed,
        label: Text('Generate Game'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
class NumberButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  const NumberButton({
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(number),
    );
  }
}






