I want this dart model list.
class Bet {
  String amount;
  String digit;

  Bet({required this.amount, required this.digit});
}

Here is user input and here is expected output.

Input=> 36.54.67.89 = 500
Output=> [Bet(amount: 500, digit:36), Bet(amount: 500, digit:54), Bet(amount: 500, digit:67), Bet(amount: 500, digit:89)]
   
Input=> 60 30 89 53 - 500
Output=> [Bet(amount: 500, digit:60), Bet(amount: 500, digit:30), Bet(amount: 500, digit:89), Bet(amount: 500, digit:53)]

Input=> 78 35 41 70 500
Output=> [Bet(amount: 500, digit:78), Bet(amount: 500, digit:35), Bet(amount: 500, digit:41), Bet(amount: 500, digit:70)]

Input=> 46*67*89 500
Output=> [Bet(amount: 500, digit:46), Bet(amount: 500, digit:67), Bet(amount: 500, digit:89)]

Input=> 67,78,34 1000
Output=> [Bet(amount: 1000, digit:67), Bet(amount: 1000, digit:78), Bet(amount: 1000, digit:34)]

Input=> 67/89/45/63 R400
Output=> [Bet(amount: 400, digit:76), Bet(amount: 400, digit:98), Bet(amount: 400, digit:54), Bet(amount: 400, digit:36)]

Input=> 56.98.23.34.08 = 700@400
Output=> [Bet(amount: 700, digit:56), Bet(amount: 700, digit:98), Bet(amount: 700, digit:23), Bet(amount: 700, digit:34), Bet(amount: 700, digit:08), Bet(amount: 400, digit:65), Bet(amount: 400, digit:89), Bet(amount: 400, digit:32), Bet(amount: 400, digit:43), Bet(amount: 400, digit:80)]

Input=> 56.76.32 = r700
Output=> [Bet(amount: 700, digit:65), Bet(amount: 700, digit:67), Bet(amount: 700, digit:23)]

Input=> 78 56 21 500r
Output=> [Bet(amount: 500, digit:87), Bet(amount: 500, digit:65), Bet(amount: 500, digit:12)]

Input=> 87.56.21.58 (r)500
Output=> [Bet(amount: 500, digit:78), Bet(amount: 500, digit:65), Bet(amount: 500, digit:12), Bet(amount:500, digit:85)]

Input=> 55 1000
Output=> [Bet(amount: 1000, digit:55)]

Input=> 54@500
Output=> [Bet(amount: 500, digit:45)]
