import 'dart:io';

void main () {
  bool prime = true;
  stdout.write('Masukan angka: ');
  String? input = stdin.readLineSync();
  int? bilangan = int.tryParse(input!);
  for (var i = 2; i <bilangan!; i++){
    if (bilangan % i == 0){
      prime = false;
      break;
    }
  }
  if (prime == true){
    print('$bilangan adalah bilangan prima');
  } else {
    print('$bilangan bukan bilangan prima');
  }
}