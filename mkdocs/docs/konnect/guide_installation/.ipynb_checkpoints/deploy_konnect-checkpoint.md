# **Konnect sur votre PC** - Etape 2

## Téléchargement du dossier

!!! note "Pour débuter"

    Télécharger et extraire [**Konnect**](https://konsilion.fr/wp/wp-content/uploads/2022/08/Konnect.zip){target=} dans votre emplacement préféré *(ex : Bureau, Documents, etc)*

## Paramètrage initial

??? tip "Astuces pour le terminal"

    * Pour ouvrir un terminal : clic droit dans le dossier maitre, et ouvrir terminal.
    * **La souris ne marche pas** dans le terminal, il faut utiliser les flèches
    * Les raccourcis comme copier, coller sont différents. Ainsi préferer le clic droit pour voir les options disponibles.


??? tip "Où est le fichier .env ?"

    Dans le dossier **Konnect > server > etc > .env.example** | Afin d'afficher les fichiers masqués suivre les instructions ci-dessous.

    === "Windows"

        Pour afficher les éléments masqués sous Windows suivez ce [lien](https://support.microsoft.com/fr-fr/windows/voir-les-fichiers-et-les-dossiers-cach%C3%A9s-dans-windows-97fbc472-c603-9d90-91d0-1166d1d9f4b5){target=}
        
    === "MacOS"
    
        Afin d'afficher les éléments masqués sous MacOS ++cmd+shift++ + .
    
    === "Linux"
    
        Afin d'afficher les éléments masqués sous Linux tapez ++ctrl++ + H



??? tip "Où trouver mon chemin minconda3 ?"

    === "Windows"
    
        Dans un terminal, taper la command `where conda` et **séléctionner le chemin jusqu'à `.../miniconda3`**, ne pas prendre après
        
    === "MacOS"
    
        Dans un terminal, taper la command `whereis conda` et **séléctionner le chemin jusqu'à `.../miniconda3`**, ne pas prendre après
        
    === "Linux"
    
        Dans un terminal, taper la command `whereis conda` et **séléctionner le chemin jusqu'à `.../miniconda3`**, ne pas prendre après




=== "Windows"

    * Renommer le fichier `.env.example` en `.env` *(voir ci-dessous 'Où est le fichier .env)*
    * Ouvrir le fichier `.env` avec un éditeur de texte et **suivre les instructions**.
    * Activer GitBash dans Windows terminal depuis dossier Konnect - [*voir tutoriel*](https://www.youtube.com/embed/zM9Mb-otqww?start=53){target=}
    * Taper la commande suivante : `bash konnect.sh` et ++enter++

=== "MacOS"

    * Renommer le fichier `.env.example` en `.env` *(voir ci-dessous 'Où est le fichier .env)*
    * Ouvrir le fichier `.env` avec un éditeur de texte et **lire les commentaires**.
    * Ouvrir le terminal depuis le dossier Konnect
    * Taper la commande suivante : `bash konnect.sh` et ++enter++

=== "Linux"

    * Renommer le fichier `.env.example` en `.env` *(voir ci-dessous 'Où est le fichier .env)*
    * Ouvrir ce fichier `.env` avec un éditeur de texte et **suivre les instructions**, enregistrer.
    * Ouvrir le terminal dans le dossier Konnect
    * Taper la commande suivante : `bash konnect.sh` et ++enter++
  

---
    
- [x] Pour commencer taper `6` pour paramètrer Konnect, voilà **vous êtes Konnecté.e**[C'est à dire ?](#)

![Konnect Accueil](../../images/konnect_accueil.png)

-- *Pour vous connecter les prochaines fois, taper directement `bash konnect.sh` depuis un terminal lancer dans le dossier Konnect.*


!!! success "Etape 2/3 - Installation de Konnect terminée"
    
        **Une bonne chose de faite**, vous avez maintenant votre maison numérique Konnect. **Mais il est essentiel** que vous meubliez cette maison, il s'agit de **votre environnement**.

<br>

<style>
  .md-content__button {
    display: none;
  }
</style>