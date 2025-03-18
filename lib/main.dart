import 'package:appbook/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lista de Livros",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
    ),
  );
}
