import 'dart:io';

void main () {
  stdout.write('Input angka: ');
  String? input = stdin.readLineSync();
  int angka = int.parse(input!);
  int totalPembagi = 0;
  for (var i = 1; i < angka; i++){
    if (angka%i == 0){
      totalPembagi += i;
    }
  }
  if (totalPembagi == angka){
    print('true');
  } else {
    print('false');
  }
  
}