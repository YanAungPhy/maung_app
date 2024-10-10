import 'package:easy_localization/easy_localization.dart';
import 'package:two_d/models/bet_body_model.dart';

Map<String, String> mmToEngMap = {
  "၁": "1",
  "၂": "2",
  "၃": "3",
  "၄": "4",
  "၅": "5",
  "၆": "6",
  "၇": "7",
  "၈": "8",
  "၉": "9",
  "၀": "0"
};

List<String> numberList = List.generate(100, (index) {
  if (index.toString().length == 1) {
    return "0$index";
  } else {
    return index.toString();
  }
});

class Util {
  static List<BetBodyDetailsModel> parseInput(String rawInput) {
    String userInput = "";
    for (var entry in mmToEngMap.entries) {
      // print("key ${entry.key}");
      userInput = userInput.isEmpty
          ? rawInput.replaceAll(entry.key, entry.value)
          : userInput.replaceAll(entry.key, entry.value);
      // print("userInput ${entry.key}: $userInput");
    }

    userInput = userInput.toLowerCase();

    List<BetBodyDetailsModel> bets = [];
    String mainDigit = "";
    String amount = "";
    RegExp noutPateReg = RegExp(r'နောက်|ပိတ်');
    RegExp breakReg = RegExp(r'b|ဘရိတ်');
    RegExp natKhat = RegExp(r'နက်ခက်|နက္ခတ်|N|n');
    RegExp puuReg = RegExp(r'\d+');

    if (userInput.contains('ညီကို')) {
      amount = userInput.split('ညီကို').last.trim();
      List<String> digits = [
        '01',
        '12',
        '23',
        '34',
        '45',
        '56',
        '67',
        '78',
        '89'
      ];
      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else if (userInput.contains("ပူး") ||
        userInput.contains("A") ||
        userInput.contains('a')) {
      Match? match = puuReg.firstMatch(userInput);
      // print("${userInput.split(match!.group(0)!)}");
      //mainDigit = userInput.split(match!.group(0)!).first;
      amount = match!.group(0)!;

      List<String> digits = numberList
          .where((element) => element.split('').first == element.split('').last)
          .toList();

      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else if (userInput.contains(natKhat)) {
      Match? match = natKhat.firstMatch(userInput);
      // print("${userInput.split(match!.group(0)!)}");
      //mainDigit = userInput.split(match!.group(0)!).first;
      amount = userInput.split(match!.group(0)!).last.trim();

      List<String> digits = ['07', '18', '24', '35', '69'];

      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else if (userInput.contains(breakReg)) {
      // print("contain break ");
      userInput = userInput.replaceAll("k", "");
      Match? match = breakReg.firstMatch(userInput);

      ///print("${userInput.split(match!.group(0)!)}");
      mainDigit = userInput.split(match!.group(0)!).first;
      amount = userInput.split(match.group(0)!).last;
      RegExp moreNumberExp = RegExp(r'[\/.*]');
      List<String> digits = [];

      if (mainDigit.contains(moreNumberExp)) {
        List<String> number = mainDigit.split(moreNumberExp);
        for (int i = 0; i < number.length; i++) {
          digits.addAll(List.generate(int.parse(number[i]) + 1, (index) {
            int j = int.parse(number[i]) - index;
            return "$index$j";
          }).toList());
        }
      } else {
        digits = List.generate(int.parse(mainDigit) + 1, (index) {
          int j = int.parse(mainDigit) - index;
          return "$index$j";
        }).toList();
      }

      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else if (userInput.contains(noutPateReg)) {
      Match? match = noutPateReg.firstMatch(userInput);
      // print("${userInput.split(match!.group(0)!)}");
      mainDigit = userInput.split(match!.group(0)!).first;
      amount = userInput.split(match.group(0)!).last;

      RegExp moreNumberExp = RegExp(r'[\/.*]');
      List<String> digits = [];

      if (mainDigit.contains(moreNumberExp)) {
        List<String> number = mainDigit.split(moreNumberExp);
        for (int i = 0; i < number.length; i++) {
          digits.addAll(numberList
              .where((element) => element.endsWith(number[i]))
              .toList());
        }
      } else {
        digits =
            numberList.where((element) => element.endsWith(mainDigit)).toList();
      }

      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else if (userInput.contains('ထိပ်') || userInput.contains('ရှေ့')) {
      mainDigit = userInput.contains('ထိပ်')
          ? userInput.split('ထိပ်').first
          : userInput.split('ရှေ့').first;
      amount = userInput.contains('ထိပ်')
          ? userInput.split('ထိပ်').last
          : userInput.split('ရှေ့').last;

      RegExp moreNumberExp = RegExp(r'[\/.*]');
      List<String> digits = [];

      if (mainDigit.contains(moreNumberExp)) {
        List<String> number = mainDigit.split(moreNumberExp);
        for (int i = 0; i < number.length; i++) {
          digits.addAll(numberList
              .where((element) => element.startsWith(number[i]))
              .toList());
        }
      } else {
        digits = numberList
            .where((element) => element.startsWith(mainDigit))
            .toList();
      }

      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else if (userInput.contains('ပါ') ||
        userInput.contains('p') ||
        userInput.contains('ပါတ်') ||
        userInput.contains('အပါ')) {
      if (userInput.contains('ပါ') &&
          !userInput.contains('ပါတ်') &&
          !userInput.contains('အပါ')) {
        mainDigit = userInput.split('ပါ').first;
        amount = userInput.split('ပါ').last;
      } else if (userInput.contains('p')) {
        mainDigit = userInput.split('p').first;
        amount = userInput.split('p').last;
      } else if (userInput.contains('ပါတ်') && !userInput.contains('အ')) {
        mainDigit = userInput.split('ပါတ်').first;
        amount = userInput.split('ပါတ်').last;
      } else if (userInput.contains('အပါ')) {
        mainDigit = userInput.split('အပါ').first;
        amount = userInput.split('အပါ').last;
      }

      RegExp moreNumberExp = RegExp(r'[\/.*]');
      List<String> digits = [];

      if (mainDigit.contains(moreNumberExp)) {
        List<String> number = mainDigit.split(moreNumberExp);
        for (int i = 0; i < number.length; i++) {
          digits.addAll(numberList
              .where((element) => element.contains(number[i]))
              .toList());
        }
      } else {
        digits =
            numberList.where((element) => element.contains(mainDigit)).toList();
      }

      for (int i = 0; i < digits.length; i++) {
        bets.add(BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
      }
    } else {
      RegExp amountRegex = RegExp(r'[rR@]?(\d+)[rR@]?$');

      RegExp secondAmountRegex = RegExp(r'(\d+)[rR@](\d+)$');

      RegExp digitRegex = RegExp(r'\b(\d{2})\b');
      bool hasTwoAmt = false;

      Match? amountMatch = amountRegex.firstMatch(userInput);
      Match? secondMatch;
      try {
        secondMatch = secondAmountRegex.firstMatch(userInput);

        hasTwoAmt = true;
      } catch (e) {
        hasTwoAmt = false;
      }

      if (amountMatch != null) {
        String amount = amountMatch.group(1)!;
        String? straightAmount;
        String? reverseAmount;
        if (hasTwoAmt && secondMatch != null) {
          straightAmount = secondMatch.group(1)!;
          reverseAmount = secondMatch.group(2);

          print('Straight amount: $straightAmount');
          if (reverseAmount != null) {
            print('Reverse amount: $reverseAmount');
          }
        }

        print("amount $amount");
        List<String> digits =
            digitRegex.allMatches(userInput).map((m) => m.group(1)!).toList();

        bool reverseDigits = userInput.contains('r') ||
            userInput.contains('R') ||
            userInput.contains('@') ||
            userInput.contains('(r)');

        print("reverDights $reverseDigits");

        if (straightAmount != null) {
          for (int i = 0; i < digits.length; i++) {
            bets.add(BetBodyDetailsModel(
                amount: straightAmount, digit: digits[i].trim()));
          }
        }

        for (int i = 0; i < digits.length; i++) {
          if (reverseDigits) {
            digits[i] = digits[i].split('').reversed.join(); // Reverse digits
          }
          bets.add(
              BetBodyDetailsModel(amount: amount, digit: digits[i].trim()));
        }
      }
    }

    return bets;
  }
}
