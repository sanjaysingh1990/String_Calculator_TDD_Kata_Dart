library string_calculator;

class StringCalculator {

  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> delimiters = [','];
    String values = numbers;

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterPart = parts[0];

      final regex = RegExp(r'\[(.*?)\]');
      final matches = regex.allMatches(delimiterPart);

      delimiters = matches.map((m) => m.group(1)!).toList();
      values = parts[1];
    }

    for (final d in delimiters) {
      values = values.replaceAll(d, ',');
    }

    values = values.replaceAll('\n', ',');
    final nums = values.split(',').map(int.parse).toList();

    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    return nums.where((n) => n <= 1000).fold(0, (a, b) => a + b);
  }


}
