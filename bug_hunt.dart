
class Phone {
  // Starting the values so non-nullable fields are initialized
  String _brand = '';
  int _battery = 0;

  // Constructor sets _brand and _battery
  Phone(String brand, int battery) {
    this._brand = brand;
    this._battery = battery;
  }

  // Getter for _battery
  int get battery {
    return _battery;
  }

  // Setter for _battery: accepts only from 0 to 100
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

  //Passing brand and battery up to Phone using super and set system
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    this.system = system;
  }

  // restart() is a method on SmartPhone (not overriding Phone)
  void restart() {
    print('Restarting $system');
  }
}

void main() {
  //Object creation with new
  Phone p = new Phone('Tecno', 50);

  // New battery setter (0 to 100)
  p.battery = 100;

  // Reads then prints 100
  print(p.battery);
}