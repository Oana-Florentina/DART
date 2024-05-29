/* Faceti o aplicatie care sa gestioneze o lista de cumparaturi.
 Aplicatia va contine cel putin un GridView, un TextField si un Button.
  Aplicatia va permite adaugarea si stergerea elementelor din lista. */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Lista de cumparaturi'),
      ),
      body: ListaCumparaturi(),
    ),
  ));
}
