/*Pentru o lista data, sa se returneze numarul de "perechi bune". 
O pereche (i, j) este buna daca list[i] == list[j] si i != j. Fiecare pereche va fi reprezentata printr-un set.*/

int numarPerechiBune(List lista) {
 

  int contorPerechiBune = 0;

  for (var i = 0; i < lista.length; i++) {
    
    for(var j = 0; j < lista.length; j++){
      if(i != j && lista[i]==lista[j]){
        contorPerechiBune++;
      }
    }

  }

  return contorPerechiBune ~/2;
}

void main() {
  List lista = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5];
  
  print(numarPerechiBune(lista)); 
}
