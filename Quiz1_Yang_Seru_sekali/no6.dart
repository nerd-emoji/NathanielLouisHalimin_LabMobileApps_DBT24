void main() {
  Account myAccount = Account();
  myAccount.deposit(1000);
  print('Balance: \$${myAccount.balance}');
  myAccount.withdraw(1500);
  print('Balance: \$${myAccount.balance}');

}

class Account {
  double balance = 0;
  deposit(double amount) {
    balance += amount;
  }
  withdraw(double amount) {
    if (balance < amount) {
      print('Balance anda kurang');
      return;
    } else {
      balance -= amount;
    }
  }
}
