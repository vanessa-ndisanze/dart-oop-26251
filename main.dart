// The part 1:Buscard

class BusCard {
  // ----------PRIVATE FIELDS ----------
  String _owner = '';
  int _balance = 0;

  // ----------CONSTRUCTOR ----------
  BusCard(String owner, int balance) {
    this._owner = owner;
    this._balance = balance;
  }

  // ----------OWNER Getter ----------
  String get owner {
    return _owner;
  }

  // ----------owner Setter (EXAMPLE) ----------
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }
  // ----------TODO 1:Balance Getter ----------
  int get balance {
    return _balance;
  }

  // ----------Showing info Method----------
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // ----------TODO 2: top up----------
  void topUp(int amount) {
    if (amount < 500 || amount > 50000) {
      print('Error: top-up must be 500 to 50000 RWF');
    } else {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    }
  }

  // ----------TODO 3: The pay method ----------.
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}
// The part2: StudentCard 
class StudentCard extends BusCard {
  // ---------- PRIVATE FIELD ----------
  int _discount = 0;

  // ---------- CONSTRUCTOR ----------
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    this._discount = discount;
  }
  // ---------- Override showinfo method----------
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }
 // ---------- TODO 4: Override and pay method----------
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}
void main() {
  // my numbers: D = 51, L = 1
  // my Starting balance = 1510 RWF,Bus fare= 251 RWF, Discount= 11%
  // example
  BusCard card = BusCard('Ama', 1000);
  card.owner = 'Al';
  card.showInfo();

  // TODO 5 changing name and showinfo
  card.owner = 'Vanessa Ndisanze Girimpundu';
  card.showInfo();

  // TODO 6 top up
  card.topUp(100);
  card.topUp(2000);

  // TODO 7 paying bus fare 2 and showInfo()
  card.pay(251);
  card.pay(251);
  card.showInfo();

  // TODO 8 creating a StudentCard with my name starting balance and discount
  StudentCard studentCard = StudentCard('Vanessa Ndisanze Girimpundu', 1510, 11);

  // TODO 9: paying my bus fare with the student card and showInfo()
  studentCard.pay(251);
  studentCard.showInfo();
}