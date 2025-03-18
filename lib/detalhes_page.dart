import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({super.key});

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
              "https://static.wixstatic.com/media/31a549_7dffb191bffa440686e5a148b8e042d9~mv2.jpg/v1/fill/w_480,h_768,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/31a549_7dffb191bffa440686e5a148b8e042d9~mv2.jpg",
              height: 280,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Relatos Por Trás do Véu",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Um Aterrorizante Thriller Investigativo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
