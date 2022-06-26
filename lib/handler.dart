import 'dart:math';

import './calculator_keys.dart';

class Handler {
  final Function updateResult;
  static Keys lastKeyHit = Keys.ac, lastOperator = Keys.equal;
  static double previousRes = 0, res = 0;
  static int _pointCounter = 0;
  static String outRes = '0';

  Handler(this.updateResult);

  void _setResult(
      String output, double result, double previousResult, Keys lastKey) {
    updateResult(output);
    res = result;
    previousRes = previousResult;
    lastKeyHit = lastKey;
    outRes = output;
    print(
        'previous = $previousResult, result = $result, last_key = $lastKey, last_operator = $lastOperator');
  }

  void ac(Function setIcon) {
    setIcon('AC');
    if (lastKeyHit == Keys.ac || lastKeyHit == Keys.equal) {
      _setResult('0', 0, 0, Keys.ac);
      lastOperator = Keys.equal;
    } else {
      _setResult('0', 0, previousRes, Keys.ac);
    }
    _pointCounter = 0;
  }

  void equal() {
    switch (lastOperator) {
      case Keys.add:
        res += previousRes;
        break;
      case Keys.subtract:
        res = previousRes - res;
        break;
      case Keys.divide:
        if (res == 0) {
          _setResult('ERROR', 0, 0, Keys.equal);
          _pointCounter = 0;
          return;
        }
        res = previousRes / res;
        break;
      case Keys.multiply:
        res = previousRes * res;
        break;
      default:
        break;
    }
    _setResult(getString(res), 0, res, Keys.equal);
    _pointCounter = 0;
  }

  void number(int num, Function updateAc) {
    updateAc('C');
    if (_pointCounter > 0) {
      _setResult(getString(res + pow(10, -1 * _pointCounter) * num),
          res + pow(10, -1 * _pointCounter) * num, previousRes, Keys.number);
      _pointCounter += 1;
    } else {
      _setResult(getString(10 * res + num), (10 * res + num), previousRes,
          Keys.number);
    }
  }

  void point() {
    if (_pointCounter == 0) {
      _setResult(getString(res) + '.', res, previousRes, Keys.point);
      _pointCounter = 1;
    }
  }

  void operator(String op) {
    print(op);
    Keys key;
    switch (op) {
      case '/':
        key = Keys.divide;
        break;
      case '*':
        key = Keys.multiply;
        break;
      case '+':
        key = Keys.add;
        break;
      case '-':
        key = Keys.subtract;
        break;
      default:
        key = Keys.add;
    }
    equal();
    lastOperator = key;
    _setResult(outRes, res, previousRes, key);
    _pointCounter = 0;
  }

  String getString(double value) {
    if (value == value.toInt()) {
      return (value.toInt()).toString();
    }
    return '$value';
  }
}
