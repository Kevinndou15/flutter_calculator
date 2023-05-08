import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _expression = '';

  void _addSymbol(String symbol) {
    setState(() {
      _expression += symbol;
    });
  }

  void _clear() {
    setState(() {
      _expression = '';
    });
  }

  void _calculate() {
    setState(() {
      try {
        final result = Parser()
            .parse(_expression)
            .evaluate(EvaluationType.REAL, ContextModel());
        _expression = result.toString();
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _expression,
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('+'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('x'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('.'),
              _buildButton('0'),
              ElevatedButton(
                onPressed: _clear,
                child: Text('C'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: Size(64, 64),
                  padding: EdgeInsets.all(16),
                  textStyle: TextStyle(fontSize: 24),
                ),
              ),
              _buildButton('/', color: Colors.orange),
            ],
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String symbol, {Color color = Colors.grey}) {
    return ElevatedButton(
      onPressed: () => _addSymbol(symbol),
      child: Text(symbol),
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size(64, 64),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 24),
      ),
    );
  }
}
