/*Se da un numar n.
Fiecare numar de la 1 la n este grupat in functie de suma cifrelor sale. Sa se returneze numarul de grupuri care au cele mai multe numere.*/

int numarGrupuriMaxime(int n) {
  
  Map<int, int> grupuri = {};

  for (int i = 1; i <= n; i++) {
    int sumaCifre = calculeazaSumaCifre(i);
    grupuri[sumaCifre] = (grupuri[sumaCifre] ?? 0) + 1;
  }

  int numarMaxim = grupuri.values.fold(0, (prev, element) => element > prev ? element : prev);

  int numarGrupuriMaxime = grupuri.values.where((element) => element == numarMaxim).length;

  return numarGrupuriMaxime;
}

int calculeazaSumaCifre(int numar) {
  int suma = 0;
  while (numar > 0) {
    suma += numar % 10;
    numar ~/= 10;
  }
  return suma;
}

void main() {
  int n1 = 13;
  print(numarGrupuriMaxime(n1)); // Output: 4

  int n2 = 30;
  print(numarGrupuriMaxime(n2)); // Output: 1
}
