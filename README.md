Dart OOP Assignment: Kigali Bus Card

Name: Vanessa Ndisanze Girimpundu
Student ID: 26251

## Part 1: Balance setter
There is no setter for balance so people cannot change the money directly. For a bus card, that is a good idea because nobody can give themselves free money or set a negative balance. Money can only be added through topUp and spent through pay.

## Part 2: Integer division ~/
~/ divides two numbers and cuts off the decimal part, leaving a whole number. For example, 237 * 17 / 100 gives 40.29, while 237 * 17 ~/ 100 gives 40.

## Part 3: My numbers and output of main.dart
My numbers:
D = 51
L = 1
Starting balance = 1510 RWF
Bus fare = 251 RWF
Student discount = 11%
Output of main.dart:
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

## Part 4: Bug Hunt

Bug 1
The line: String _brand; and int _battery;
Why it is wrong: Non-nullable fields need starting values in Dart.
How I fixed it: Added default values String _brand = ''; and int _battery = 0;.

Bug 2
The line: SmartPhone (String brand, int battery, String system) { _system = system; }
Why it is wrong: It skips passing brand and battery to Phone and writes to _system instead of system.
How I fixed it: Forwarded brand and battery to super and set this.system = system;.

Bug 3
The line: @override void restart()
Why it is wrong: Phone has no restart method to override.
How I fixed it: Removed @override so restart() is a normal method on SmartPhone.

Bug 4
The line: p.battery = 100;
Why it is wrong: battery only has a getter, so direct assignment fails.
How I fixed it: Added a setter for battery allowing values from 0 to 100.

Bug 5
The line: print(p.battery());
Why it is wrong: battery is a getter, not a method, so () is invalid.
How I fixed it: Removed () and wrote print(p.battery);.

Bug 6 (Not a bug)
The line: Phone p = new Phone ('Tecno', 50);
Why it is wrong: It is not wrong; using new is optional in Dart.
How I fixed it: No fix needed.

Part 5: Bag and BigBag prediction and output
Prediction: It will print 1 and 5. a.add() makes items 1, and a.items = -5 does not work because -5 is less than 0, so it stays 1. For b, calling add() twice calls super.add() four times (making 4), and b.items = b.items + 1 makes 5.
output:
1
5
Was I right? Yes,my prediction (1 and 5) matched the real output and worked they way i expected.