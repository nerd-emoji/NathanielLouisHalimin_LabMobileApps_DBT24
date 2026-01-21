import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Input gunting, kertas, atau batu: ');
  String? input = stdin.readLineSync();
  int pilihanKomputer = Random().nextInt(3);
  String? pilihanKomputerStr;
  if (pilihanKomputer == 0) {
    pilihanKomputerStr = 'gunting';
  } else if (pilihanKomputer == 1) {
    pilihanKomputerStr = 'kertas';
  } else if (pilihanKomputer == 2) {
    pilihanKomputerStr = 'batu';
  }

  print('Komputer Memilih: $pilihanKomputerStr');
  if (input == pilihanKomputerStr) {
    print("draw");
  } else if ((input == 'gunting' && pilihanKomputerStr == 'kertas') || (input == 'kertas' && pilihanKomputerStr == 'batu') || (input == 'batu' && pilihanKomputerStr == 'gunting')) {
    print("Kamu menang!");
  } else {
    print("Kamu kalah!");
  }
}