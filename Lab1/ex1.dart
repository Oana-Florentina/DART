bool isPrime(int x) {
  if (x < 2) {
    return false;
  }
  for (int i = 2; i <= x / 2; i++) {
    if (x % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  List<int> primes = [];
  int count = 0;
  int i = 2;

  while (count < 100) {
    if (isPrime(i)) {
      primes.add(i);
      count++;
    }
    i++;
  }

  print('First 100 prime numbers:');
  print(primes);
}