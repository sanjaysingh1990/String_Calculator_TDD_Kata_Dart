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

    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    return nums.where((n) => n <= 1000).fold(0, (a, b) => a + b);
  }

}
