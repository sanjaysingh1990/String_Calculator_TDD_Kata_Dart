library string_calculator;

class StringCalculator {

  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String values = numbers;

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      values = parts[1];
    }

    values = values.replaceAll('\n', delimiter);
    final nums = values.split(delimiter).map(int.parse).toList();

    return nums.reduce((a, b) => a + b);
  }

}
