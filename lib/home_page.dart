import 'package:appbook/detalhes_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController buscarLivro = TextEditingController();

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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                        "https://static.wixstatic.com/media/31a549_7dffb191bffa440686e5a148b8e042d9~mv2.jpg/v1/fill/w_480,h_768,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/31a549_7dffb191bffa440686e5a148b8e042d9~mv2.jpg"),
                    title: const Text(
                      "Relatos Por Trás do Véu",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      "Um Aterrorizante Thriller Investigativo",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetalhesPage(),
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
