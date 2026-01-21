void main () {
  int input = 6;
  int totalPembagi = 0;
  for (var i = 1; i <input; i++){
    if (input%i == 0){
      totalPembagi += i;
    }
  }
  if (totalPembagi == input){
    print('true');
  } else {
    print('false');
  }
  
}