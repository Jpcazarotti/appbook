import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Map book;
  const DetalhesPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Livro"),
        backgroundColor: const Color(0xfffac0ab),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://covers.openlibrary.org/b/id/${book['cover_i']}-M.jpg",
              height: 280,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              book['title'],
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              book['author_name']?.join(", ") ?? "Este livro não tem Autor",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Ano de Publicação: ${book['first_publish_year']}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
