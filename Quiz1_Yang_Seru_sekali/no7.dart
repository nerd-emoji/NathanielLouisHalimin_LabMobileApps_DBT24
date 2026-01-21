void main () {
  List <int> a = [5,3,5,7];
  List <int> b = [2,4,6,8];
  List <int> c = [...a, ...b];
  int biggest = c[0];
  int secondBiggest = c[0];
  for (var i in c){
    if (i > biggest){
      secondBiggest = biggest;
      biggest = i;
    } 
  }

  print("Hasil gabungan list: $c");
  print("Nilai terbesar kedua adalah: $secondBiggest");

}