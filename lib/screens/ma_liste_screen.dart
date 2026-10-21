import 'package:flutter/material.dart';
import 'package:ma_biblio/models/livre.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  // État propre à l'écran : ces données changent pendant que l'écran est
  // affiché. Un StatelessWidget ne peut pas stocker une donnée qui évolue,
  // ni demander à Flutter de se redessiner.

  // Valeur liée à la case à cocher.
  bool _nouveautesSeulement = false;

  // Les 5 genres, tous cochés au départ : clé = nom du genre,
  // valeur = coché ou non.
  final Map<String, bool> _genres = {
    'Roman': true,
    'Poésie': true,
    'Théâtre': true,
    'Essai': true,
    'BD': true,
  };

  // Icône associée à chaque genre.
  static const Map<String, IconData> _iconesGenres = {
    'Roman': Icons.menu_book,
    'Poésie': Icons.auto_stories,
    'Théâtre': Icons.theater_comedy,
    'Essai': Icons.edit_note,
    'BD': Icons.emoji_emotions,
  };

  @override
  Widget build(BuildContext context) {
    // Livres affichés : genre coché ET (si la case est cochée) nouveauté.
    final affiches = livres.where((livre) {
      final genreCoche = _genres[livre.genre] ?? false;
      final nouveauteOk = !_nouveautesSeulement || livre.nouveaute;
      return genreCoche && nouveauteOk;
    }).toList();

    // Compteur de l'AppBar : recalculé à chaque build(), donc il se met à
    // jour tout seul après chaque setState (case cochée, filtre modifié).
    final nombreLus = affiches.where((livre) => livre.lu).length;

    // État de la case « Tous les genres » (calculé, pas stocké) :
    // true si tout est coché, false si rien, null (tiret) sinon.
    final tousCoches = _genres.values.every((coche) => coche);
    final aucunCoche = _genres.values.every((coche) => !coche);
    final bool? etatTous = tousCoches ? true : (aucunCoche ? false : null);

    return Scaffold(
      appBar: AppBar(
        // X = livres lus parmi les livres affichés, Y = livres affichés.
        title: Text('Lus : $nombreLus / ${affiches.length}'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text('Afficher uniquement les nouveautés'),
            value: _nouveautesSeulement,
            onChanged: (valeur) {
              // Sans setState : la variable change bien en mémoire, mais
              // build() n'est pas rappelé, donc la case reste décochée à
              // l'écran et la liste n'est pas filtrée.
              setState(() {
                _nouveautesSeulement = valeur ?? false;
              });
            },
          ),
          const Divider(height: 1),
          CheckboxListTile(
            tristate: true,
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.category),
            title: const Text(
              'Tous les genres',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            activeColor: Colors.indigo,
            value: etatTous,
            onChanged: (_) {
              // On ignore la valeur reçue : en mode tristate, Flutter
              // fait tourner la case (false → true → null), ce qui ne
              // correspond pas à ce qu'on veut. On décide nous-mêmes :
              // si tout est coché, on décoche tout ; sinon on coche tout.
              setState(() {
                for (final genre in _genres.keys) {
                  _genres[genre] = !tousCoches;
                }
              });
            },
          ),
          // Une case par genre, générée à partir de la map.
          // Le spread (...) insère les tuiles directement dans la liste
          // des enfants de la Column.
          ..._genres.keys.map(
            (genre) {
              // Nombre de livres de ce genre dans la liste complète.
              final nombre =
                  livres.where((livre) => livre.genre == genre).length;
              return CheckboxListTile(
                // controlAffinity.leading : case à gauche, icône secondary
                // à droite (trailing/platform : case à droite).
                controlAffinity: ListTileControlAffinity.leading,
                // Icône adaptée au genre (Icons.book par défaut).
                secondary: Icon(_iconesGenres[genre] ?? Icons.book),
                title: Text(genre),
                subtitle: Text('$nombre livre${nombre > 1 ? 's' : ''}'),
                activeColor: Colors.indigo,
                value: _genres[genre] ?? false,
                onChanged: (valeur) {
                  setState(() {
                    _genres[genre] = valeur ?? false;
                  });
                },
              );
            },
          ),
          const Divider(height: 1),

          // Liste des livres filtrés par les genres cochés.
          // Expanded : la Column donne une hauteur non bornée à ses enfants,
          // le ListView doit donc recevoir l'espace restant.
          Expanded(
            child: affiches.isEmpty
                ? const Center(child: Text('Aucun livre à afficher'))
                : ListView.separated(
                    itemCount: affiches.length,
                    itemBuilder: (context, index) {
                      final livre = affiches[index];
                      return CheckboxListTile(
                        secondary: CircleAvatar(
                          backgroundColor: livre.couleur,
                          child: Text(
                            livre.titre[0],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          livre.titre,
                          // Titre barré si le livre est lu.
                          style: TextStyle(
                            decoration: livre.lu
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('${livre.auteur} – ${livre.annee}'),
                        activeColor: Colors.indigo,
                        value: livre.lu,
                        onChanged: (valeur) {
                          setState(() {
                            livre.lu = valeur ?? false;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(indent: 72, height: 1),
                  ),
          ),
        ],
      ),
    );
  }
}