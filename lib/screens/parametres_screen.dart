import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        // divideTiles insère automatiquement un séparateur entre les tuiles
        // (pas avant la première ni après la dernière).
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mon profil'),
              subtitle: const Text('Nom, e-mail, mot de passe'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil sélectionné')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              // Couleur de fond de la tuile
              tileColor: Colors.indigo.shade50,
              // Couleur des icônes (leading et trailing)
              iconColor: Colors.indigo,
              // Couleur du texte (title et subtitle)
              textColor: Colors.indigo.shade900,
              // Coins arrondis (le fond et l'effet d'encre suivent cette forme)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Langue'),
              subtitle: Text('Français'),
            ),

            // --- Test 1 : dense: true ---
            // Effet : la tuile est plus compacte (hauteur réduite, environ
            // 48 px au lieu de 56 px) et le texte est un peu plus petit.
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos (dense)'),
              dense: true,
              onTap: () {},
            ),

            // --- Test 2 : isThreeLine: true ---
            // Effet : la tuile est prévue pour 3 lignes (titre + subtitle sur
            // deux lignes) : elle est plus haute (environ 88 px) et l'icône
            // leading est alignée en haut au lieu d'être centrée
            // verticalement. Sans subtitle, la propriété n'a aucun effet.
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos (isThreeLine)'),
              subtitle: const Text('MaBiblio\nVersion 1.0.0'),
              isThreeLine: true,
              onTap: () {},
            ),

            // --- Test 3 : enabled: false ---
            // Effet : la tuile est grisée (icône et textes en couleur
            // désactivée) et n'est plus interactive : pas d'effet d'encre,
            // onTap ignoré.
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos (désactivé)'),
              enabled: false,
              onTap: () {},
            ),
          ],
        ).toList(),
      ),
    );
  }
}