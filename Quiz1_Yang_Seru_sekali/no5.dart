import 'dart:io';
import 'dart:math';

void main () {
  List<Ujian> daftarUjian = [];
  bool lanjut = true;
  int addedCount = 0;
  while (addedCount < 3) {
    stdout.write('Input nama student: ');
    String? nama = stdin.readLineSync();

    stdout.write('Input nilai $nama: ');
    String? nilaiInput = stdin.readLineSync();
    int? nilai = int.tryParse(nilaiInput!);

    if (nama != null && nilai != null) {
      Ujian ujian = Ujian();
      ujian.nama = nama;
      ujian.nilai = nilai;
      daftarUjian.add(ujian);
    } else {
      print('Input tidak valid. Silakan coba lagi.');
      continue;
    }
    addedCount++;
  }
  double totalNilai = 0;
  double rataRata = 0;
  for (var i in daftarUjian) {
    totalNilai += i.nilai!;
  }
  rataRata = totalNilai / daftarUjian.length;
  print('Rata-rata nilai: $rataRata');
}

class Ujian {
  String? nama;
  int? nilai;
}