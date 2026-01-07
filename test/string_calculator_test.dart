import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  test('Empty string returns 0', () {
    final calculator = StringCalculator();
    expect(calculator.add(''), equals(0));
  });

  test('Single number returns itself', () {
    final calculator = StringCalculator();
    expect(calculator.add('1'), equals(1));
  });

  test('Two numbers separated by comma', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,5'), equals(6));
  });

  test('Multiple numbers return their sum', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2,3,4'), equals(10));
  });

  test('Handles new lines between numbers', () {
    final calculator = StringCalculator();
    expect(calculator.add('1\n2,3'), equals(6));
  });

  test('Supports custom delimiter', () {
    final calculator = StringCalculator();
    expect(calculator.add('//;\n1;2'), equals(3));
  });

}
