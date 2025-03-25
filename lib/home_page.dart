import 'dart:convert';
import 'package:appbook/detalhes_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List books = [];
  TextEditingController buscarLivro = TextEditingController();
  bool isLoading = true;
  List listaBooks = [];

  @override
  void initState() {
    super.initState();
    listarLivros();
    buscarLivro.addListener(() {
      filtrarLivros();
    });
  }

  Future<void> listarLivros() async {
    try {
      final response = await http.get(
        Uri.parse("https://openlibrary.org/search.json?q=portugues&limit=20"),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          books = data["docs"];
          listaBooks = books;
          isLoading = false;
        });
      } else {
        mostrarErro("Falha ao carregar os dados.");
      }
    } catch (e) {
      mostrarErro("Erro: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
      ),
    );
  }

  void filtrarLivros() {
    String pesquisa = buscarLivro.text.toLowerCase();
    setState(() {
      listaBooks = books.where((book) {
        return book['title'].toLowerCase().contains(pesquisa);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Livros"),
        centerTitle: true,
        backgroundColor: const Color(0xfffac0ab),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: buscarLivro,
              decoration: const InputDecoration(
                label: Text("Buscar Livro"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                suffixIcon: Icon(Icons
                    .search), // 'prefixIcon' -> lado esquerdo; 'suffixIcon' -> lado direito
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaBooks.length,
              itemBuilder: (context, index) {
                var book = listaBooks[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      "https://covers.openlibrary.org/b/id/${book['cover_i']}-M.jpg",
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      book['title'],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      book['author_name']?.join(", ") ??
                          "Este livro não tem Autor",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesPage(book: book),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
