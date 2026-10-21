import 'package:flutter/material.dart';

class Livre {
  final String titre;
  final String auteur;
  final int annee;
  final double note;
  final Color couleur;

  const Livre({
    required this.titre,
    required this.auteur,
    required this.annee,
    required this.note,
    required this.couleur,
  });
}

// Jeu de données de test
const List<Livre> livres = [
  Livre(
    titre: 'Le Petit Prince',
    auteur: 'Antoine de Saint-Exupéry',
    annee: 1943,
    note: 4.8,
    couleur: Colors.indigo,
  ),
  Livre(
    titre: "L'Étranger",
    auteur: 'Albert Camus',
    annee: 1942,
    note: 4.3,
    couleur: Colors.teal,
  ),
  Livre(
    titre: 'Les Misérables',
    auteur: 'Victor Hugo',
    annee: 1862,
    note: 4.6,
    couleur: Colors.deepOrange,
  ),
  Livre(
    titre: 'Germinal',
    auteur: 'Émile Zola',
    annee: 1885,
    note: 4.2,
    couleur: Colors.brown,
  ),
];