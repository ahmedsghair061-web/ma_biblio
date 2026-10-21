import 'package:flutter/material.dart';

class Livre {
  final String titre;
  final String auteur;
  final int annee;
  final double note;
  final Color couleur;
  final String genre;
  final bool nouveaute;

  // Seul champ modifiable : on peut cocher/décocher « lu » après coup.
  // Un constructeur const exige que tous les champs soient final,
  // donc le constructeur et la liste `livres` ne sont plus const.
  bool lu;

  Livre({
    required this.titre,
    required this.auteur,
    required this.annee,
    required this.note,
    required this.couleur,
    required this.genre,
    this.nouveaute = false,
    this.lu = false,
  });
}

// Jeu de données de test
final List<Livre> livres = [
  Livre(
    titre: 'Le Petit Prince',
    auteur: 'Antoine de Saint-Exupéry',
    annee: 1943,
    note: 4.8,
    couleur: Colors.indigo,
    genre: 'Roman',
  ),
  Livre(
    titre: "L'Étranger",
    auteur: 'Albert Camus',
    annee: 1942,
    note: 4.3,
    couleur: Colors.teal,
    genre: 'Roman',
    nouveaute: true,
  ),
  Livre(
    titre: 'Les Misérables',
    auteur: 'Victor Hugo',
    annee: 1862,
    note: 4.6,
    couleur: Colors.deepOrange,
    genre: 'Roman',
  ),
  Livre(
    titre: 'Germinal',
    auteur: 'Émile Zola',
    annee: 1885,
    note: 4.2,
    couleur: Colors.brown,
    genre: 'Roman',
  ),
  Livre(
    titre: 'Madame Bovary',
    auteur: 'Gustave Flaubert',
    annee: 1857,
    note: 4.1,
    couleur: Colors.purple,
    genre: 'Roman',
  ),
  Livre(
    titre: 'Candide',
    auteur: 'Voltaire',
    annee: 1759,
    note: 4.0,
    couleur: Colors.blueGrey,
    genre: 'Roman',
    nouveaute: true,
  ),
  Livre(
    titre: 'Notre-Dame de Paris',
    auteur: 'Victor Hugo',
    annee: 1831,
    note: 4.4,
    couleur: Colors.red,
    genre: 'Roman',
  ),
  Livre(
    titre: 'Bel-Ami',
    auteur: 'Guy de Maupassant',
    annee: 1885,
    note: 3.9,
    couleur: Colors.green,
    genre: 'Roman',
    nouveaute: true,
  ),
  Livre(
    titre: 'Les Fleurs du mal',
    auteur: 'Charles Baudelaire',
    annee: 1857,
    note: 4.5,
    couleur: Colors.pink,
    genre: 'Poésie',
  ),
  Livre(
    titre: 'Alcools',
    auteur: 'Guillaume Apollinaire',
    annee: 1913,
    note: 4.1,
    couleur: Colors.cyan,
    genre: 'Poésie',
  ),
  Livre(
    titre: 'Le Cid',
    auteur: 'Pierre Corneille',
    annee: 1637,
    note: 4.0,
    couleur: Colors.amber,
    genre: 'Théâtre',
  ),
  Livre(
    titre: 'Tartuffe',
    auteur: 'Molière',
    annee: 1669,
    note: 4.3,
    couleur: Colors.lime,
    genre: 'Théâtre',
  ),
  Livre(
    titre: 'Les Essais',
    auteur: 'Michel de Montaigne',
    annee: 1580,
    note: 4.2,
    couleur: Colors.deepPurple,
    genre: 'Essai',
  ),
];