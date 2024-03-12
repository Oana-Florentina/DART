class Client {

  final String _name;
  double _PurchasesAmount = 0;

  Client(this._name);

  void addPurchases(double amount) {
    _PurchasesAmount += amount;
  }

  double getPurchasesAmount() {
    return this._PurchasesAmount;
  }
}

class LoyalClient extends Client {
  double _PurchasesAmount2 = 0;

  LoyalClient(String name) : super(name);

  double getPurchasesAmount2() {
    return this._PurchasesAmount2;
  }

  void discount() {
    this._PurchasesAmount2 = super._PurchasesAmount - (super._PurchasesAmount * 0.1);
  }
}

void main() {
  Client client = Client('Ion');
  client.addPurchases(100);
  print(client.getPurchasesAmount());

  LoyalClient loyalClient = LoyalClient('Gheorghe');
  loyalClient.addPurchases(100);
  loyalClient.discount();
  print(loyalClient.getPurchasesAmount2());
}
