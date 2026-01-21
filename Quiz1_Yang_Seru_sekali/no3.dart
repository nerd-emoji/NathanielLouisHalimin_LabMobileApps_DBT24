import 'dart:io';
import 'dart:math';

void main() {
  int randomNumber = Random().nextInt(101) +1; 
  int attempts = 0;
  bool guessedCorrectly = false;
  while(guessedCorrectly == false) {
    stdout.write('Tebak angkanya: ');
    String? input = stdin.readLineSync();
    int? tebakan = int.tryParse(input!);
    if (tebakan == null) {
      print('Masukkan angka yang valid!');
      continue;
    } else if (tebakan < randomNumber) {
      print('Terlalu rendah!');
    } else if (tebakan > randomNumber) {
      print('Terlalu tinggi!');
    } else if (tebakan == randomNumber) {
      print('Selamat! Tebakanmu benar.');
      guessedCorrectly = true;
    }
    attempts += 1;
  }
  print("Selamat, berhasil menebak setelah $attempts percobaan!");
}