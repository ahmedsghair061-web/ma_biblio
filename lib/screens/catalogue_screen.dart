import 'package:flutter/material.dart';
import 'package:ma_biblio/main.dart';
import 'package:ma_biblio/models/livre.dart';


class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Uniquement les livres où nouveaute == true
    final nouveautes = livres.where((livre) => livre.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Nouveautés',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // ListView horizontal de 160 px de haut
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: nouveautes.length,
              itemBuilder: (context, index) {
                final livre = nouveautes[index];
                return Container(
                  width: 110,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: livre.couleur,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    livre.titre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Expanded : sans lui, le ListView vertical reçoit une hauteur
          // non bornée de la Column et Flutter lève l'erreur
          // « Vertical viewport was given unbounded height ».
          Expanded(
            // ListView.separated (comme builder) plutôt que
            // ListView(children: ...) : les tuiles ne sont construites que
            // lorsqu'elles deviennent visibles, au lieu des 1 000 d'un coup.
            child: ListView.separated(
              itemCount: livres.length,
              itemBuilder: (context, index) => livreTile(livres[index]),
              // indent: 72 aligne le trait avec le début du texte
              // (après le CircleAvatar du leading).
              separatorBuilder: (context, index) =>
                  const Divider(indent: 72, height: 1),
            ),
          ),
        ],
      ),
    );
  }
}