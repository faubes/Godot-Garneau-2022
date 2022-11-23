# Introduction à la programmation de jeux vidéos avec Godot

## Installation

Télécharger Godot 3.5.1 - Installation Standard (64-bit)

https://godotengine.org/download

Télécharger le projet

https://github.com/faubes/Godot-Garneau-2022

et extraire le projet dans un nouveau fichier.

Ouvrir le projet avec Godot!


## Demarrer l'engin et ouvrir le projet

Naviguer au chemin d'installation et cliquer sur l'application "Godot_3.5.1_blah".

Choisir d'*Import*er un nouveau projet et naviguer au repertoire du projet.

Double cliquer sur le projet.


## Appercu de l'interface graphique

Tester le jeu quelques minutes en appuyant sur le bouton *Play*

L'engin Godot vous presente quatre sous-fenetres:

- L'editeur permet de visualiser et modifier une Scene
- L'arbre de la Scene
- Le FileSystem, les repertoires et fichiers du projet
- L'inspecteur, qui permet de modifier les proprietes d'un objet dans la scene

On peut naviguer l'espace dans l'Editeur en tenant le boutton droit de la souris
Selectionne un objet avec boutton gauche.
Manipulations: position, rotation, taille.


Pour ajouter un objet au jeu, on ajoute un objet dans l'arbre de la scene.
Essaie d'ajouter une cle a la scene en ajoutant un objet de type Key.

>! cliquer sur le bouton *Instance Child Scene* (Icone d'une chaine) dans l'arbre de scene et choisir la Scene de type Key
>! Ajuster la position de la nouvelle cle pour qu'elle apparaisse a l'ecran (200,400)
>! On peut copier-coller les objets dans la scene


## Les objets et les arbres-scenes

Courte explication de l'arbre de la Scene: organisation d'objets dans une hierarchie.
Liens parent-enfant.

Les objets ont des Types et des Proprietes.

Quelques examples de types sont:

- Sprite: une image
- RigidBody2D: un objet qui tombe, peut etre pousse
- AnimationPlayer: permet de jouer des animations
- Timer: lance un signal apres un certain temps
- Button: permet de cliquer

> Attention: Il y a deux versions de chaque type pour les jeux 2d et 3d

Ces objets simplifient la creation de fonctions utilises par la majorite des jeux

C'est peut-etre miexu d'expliquer en essayant. 
Nous allons creer une nouvelle scene pour le deuxieme monde du jeu.

Cliquer sur *Scene > New Scene*. Choisir comme parent de l'arbre un objet de type Node2D
et renommer a World2.

Sauvegarder la nouvelle scene World2 dans le repertoire Maps du projet.

+ Ajouter TileMap; specifier le Tile Set Tilemaps/Foreground.tres dans l'inspecteur.
Ajuster les dimensions du TileMap : TileMap > Cell > Size 16x16

Dessiner un petit monde dans le TileMap (3 minutes)

Tester la scene en appuyant *Play Current Scene* avec World2 ouvert. Qu'est-ce qu'il manque!? Le joueur!

>! Ajouter le joueur Player avec le bouton *Instance Child Scene*.
>! Bonus: Ajouter un arriere-plan en Copiant-Collant celui de World1.
>! Bonus: Ajouter et definir un SafeZone


## Le moteur physique

Godot offre un Moteur physique pour simuler les collisions, les forces.
Godot a trois types d'objets physiques: 

1. StaticBody: Objet qui ne bouge pas
2. RigidBody: Objet qui peut simuler la graviter, se faire cogner
3. KinematicBody: Objet qui controlle son mouvement avec code (Joueur)

Ajoutons un objet simple qui va tomber et qui se fera pousse par le joueur.

Creer une nouvelle scene de type *RigidBody2D*.

Creer un sous-objet de type Sprite. Dans l'inspecteur du Sprite, choisir une texture, par example:
: res://kenney_pixelplatformer/Tiles/tile_0151.png

> Il est possible de glisser un image directement du FileSystem dans l'editeur, ce qui cree un sous-enfant de type Sprite (une image) automatiquement.

Tous les objets qui interagissent avec le systeme de physique doivent definir leur forme.
Ajouter un enfant de type *CollisionShape2D* 
 
Definir la forme du CollisionShape2D en selectionnant le CollisionShape2D et dans l'inspecteur, cliquer sur 
Shape > New Rectangle Shape

Sauvegarder cette scene, et ajoute quelqu-uns dans World1 ou World2 pour essayer.

## Les animations

Comment utiliser l'Animation Player?



## Bonus: Le TileMap

On peut ajouter des nouvelles cellules a notre palette en modifiant la resource

res://Tilemaps/foreground_tileset.tres

On peut ajouter des nouvelles images a cette ressource en glissant l'icone du FileSystem au TileSet.
la pancarte: res://kenney_pixelplatformer/Tiles/tile_0088.png par example

Definir une nouvelle Tuile avec Region, Collision, etc

Cliquer sur + New Single Tile > Choisir le Pointeur > Cliquer sur l'image pour definir la dimension de notre tuile.
Pour aligner exactement, modifier Snap Options dans l'inspecteur: 16x16

> Rouller la roue de la souris en tenant *CTRL* permet de controller le Zoom

Ajuster les dimensions du TileMap pour que le carre encadre parfaitment l'image.

>! Bonus: Si on veut que les personnages puissent marcher sur cette tuile, il faut egalement defininir la forme de sa collision.
>! Bonus: Un peut definir Occlusion et cette tuile bloquera la lumiere



