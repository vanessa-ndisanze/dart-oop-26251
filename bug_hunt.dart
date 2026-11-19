
class Phone {
  String _brand = '';
  int _battery = 0;
  Phone(String brand, int battery) {
    this._brand = brand;
    this._battery = battery;
  }
  int get battery {
    return _battery;
  }
  set battery(int value) {
    if (value < 0 || value > 100) {
      print('Error: battery must be 0 to 100');
    } else {
      _battery = value;
    }
  }
}

class SmartPhone extends Phone {
  String system = '';
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    this.system = system;
  }
  void restart() {
    print('Restarting $system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50);
  p.battery = 100;
  print(p.battery);
}