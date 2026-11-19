class BusCard {
  String _owner = '';
  int _balance = 0;

  BusCard(String owner, int balance) {
    this._owner = owner;
    this._balance = balance;
  }
  String get owner {
    return _owner;
  }
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }
  int get balance {
    return _balance;
  }
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }
  void topUp(int amount) {
    if (amount < 500 || amount > 50000) {
      print('Error: top-up must be 500 to 50000 RWF');
    } else {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    }
  }
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}
class StudentCard extends BusCard {
  int _discount = 0;
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    this._discount = discount;
  }
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}
void main() {
  BusCard card = BusCard('Ama', 1000);
  card.owner = 'Al';
  card.showInfo();
  card.owner = 'Vanessa Ndisanze Girimpundu';
  card.showInfo();
  card.topUp(100);
  card.topUp(2000);
  card.pay(251);
  card.pay(251);
  card.showInfo();

  StudentCard studentCard = StudentCard('Vanessa Ndisanze Girimpundu', 1510, 11);

  studentCard.pay(251);
  studentCard.showInfo();
}