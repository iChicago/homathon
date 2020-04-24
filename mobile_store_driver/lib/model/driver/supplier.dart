class Supplier {
  Supplier(
      {this.name, this.phone, this.address, this.longitude, this.latitude});

  String name;
  String phone;
  String address;
  double longitude;
  double latitude;

  static Supplier createDummySupplier({bool isStore = false}) {
    return Supplier(
        name: isStore ? 'My Store' : 'My Market',
        phone: '+966512345678',
        address: ' 1234, King Fahd rd, Olaya ',
        longitude: 24.714007,
        latitude: 46.672164);
  }
}
