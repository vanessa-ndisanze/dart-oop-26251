# Dart OOP Assignment: Kigali Bus Card

**Name:** Vanessa Ndisanze Girimpundu
**Student ID:** 26251

## My numbers
- D = 51, L = 1
- Starting balance = 1000 + (51 x 10) = 1510 RWF
- Bus fare = 200 + 51 = 251 RWF
- Student discount = 10 + 1 = 11%

## Output of main.dart
```
Error: name too short
Owner: Ama | Balance: 1000 RWF
Owner: Vanessa Ndisanze Girimpundu | Balance: 1000 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 251 RWF
Paid 251 RWF
Owner: Vanessa Ndisanze Girimpundu | Balance: 2498 RWF
Student discount: 27 RWF
Paid 224 RWF
Owner: Vanessa Ndisanze Girimpundu | Balance: 1286 RWF
Student card: 11% off
```

## Part 1: Why no setter for balance?
If balance had a setter, anyone could write card.balance = 999999 and give themselves free money. Without a setter, the balance can only change through topUp, which checks the amount is between 500 and 50000 RWF, and pay, which checks that the card has enough money. So the class protects its own data and every change follows a rule.

## Part 2: What does ~/ do?
~/ is integer division. It divides and throws away everything after the decimal point, so the answer is a whole number (an int).
- print(237 * 17 / 100); prints 40.29, because / gives a decimal number.
- print(237 * 17 ~/ 100); prints 40, because ~/ cuts off the .29.

I need it because balances and discounts are whole RWF amounts stored as int.

## Part 4: Bug table

| Bug | The line | Why it is wrong (my words) | My fix |
|-----|----------|----------------------------|--------|
| 1 | `String _brand;` and `int _battery;` | Dart does not allow these fields to have no value, because String and int cannot be null. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The parent Phone constructor needs brand and battery, but SmartPhone does not send them to it. | Add `: super(brand, battery)` before the `{` |
| 3 | `@override` above `void restart()` | @override only works when the parent has that method, and Phone has no restart. | Remove `@override` |
| 4 | `p.battery = 100;` | Phone has a getter for battery but no setter, so I cannot assign to it. | Add `set battery(int value)` that only accepts 0 to 100 |
| 5 | `print(p.battery());` | battery is a getter, so it is used without brackets. The brackets try to call a number like a function. | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | `new` is old style, but it is still allowed in Dart. It is just optional. | (none) |

The fixed bug_hunt.dart prints 100.

## Part 5
My prediction: it prints 1 and then 5.

Why: For Bag a, add() makes _items 1. Then a.items = -5 is refused because the setter only accepts values that are 0 or more, so _items stays 1 and it prints 1. For BigBag b, add() calls super.add() twice, so each add() adds 2. After two add() calls _items is 4. Then b.items = b.items + 1 makes it 5, which the setter accepts, so it prints 5.

Real output:
```
1
5
```

Was I right? Yes, my prediction was correct.