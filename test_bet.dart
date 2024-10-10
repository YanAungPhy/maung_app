class Bet {
  String amount;
  String digit;

  Bet({required this.amount, required this.digit});

  @override
  String toString() {
    return 'Bet(amount: $amount, digit: $digit)';
  }
}

List<Bet> parseInput(String userInput) {
  List<Bet> bets = [];
  RegExp amountRegex = RegExp(r'[rR@]?(\d+)$');
  RegExp digitRegex = RegExp(r'\b(\d{2})\b');

  Match? amountMatch = amountRegex.firstMatch(userInput);
  if (amountMatch != null) {
    String amount = amountMatch.group(1)!;

    print("amount $amount");
    print("amountMatch ${amountMatch}");
    List<String> digits =
        digitRegex.allMatches(userInput).map((m) => m.group(1)!).toList();

    bool reverseDigits = userInput.contains('r') ||
        userInput.contains('R') ||
        userInput.contains('@') ||
        userInput.contains('(r)');

    print("reverDights $reverseDigits");

    for (int i = 0; i < digits.length; i++) {
      if (reverseDigits) {
        digits[i] = digits[i].split('').reversed.join(); // Reverse digits
      }
      bets.add(Bet(amount: amount, digit: digits[i]));
    }
  }

  return bets;
}

void main() {
  // Test cases
  List<String> inputs = [
    '36.54.67.89 = 500',
    '60 30 89 53 - 500',
    '78 35 41 70 500',
    '46*67*89 500',
    '67,78,34 1000',
    '67/89/45/63 R400',
    '56.98.23.34.08 = 700@400',
    '56.76.32 = r700',
    '78 56 21 500r',
    '87.56.21.58 (r)500',
    '55 1000',
    '54@500',
    '21,32 200@400',
  ];

  for (String input in inputs) {
    print('Input=> $input');
    List<Bet> result = parseInput(input);
    print('Output=> $result\n');
  }
}
