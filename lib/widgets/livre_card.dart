
import 'package:flutter/material.dart';
import 'package:ma_biblio/main.dart';
import 'package:ma_biblio/models/livre.dart';
import 'package:ma_biblio/screens/detail_screen.dart';

class LivreCard extends StatelessWidget {
  final Livre livre;

  // Paramétrable pour comparer elevation 0, 4 et 12.
  final double elevation;

  const LivreCard({
    super.key,
    required this.livre,
    this.elevation = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shadowColor: Colors.indigo,
      color: Colors.indigo.shade50,

      // Découpe l'effet d'encre selon les coins arrondis.
      clipBehavior: Clip.antiAlias,

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(livre: livre),
            ),
          );
        },

        // Contenu de la carte
        child: livreTile(livre),
      ),
    );
  }
}
