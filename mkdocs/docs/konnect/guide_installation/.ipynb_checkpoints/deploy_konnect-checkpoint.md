# **Installer Konnect sur votre PC**

??? tip "Astuces pour le terminal"

    * Pour ouvrir un terminal : **clic droit dans le dossier cible**, et ouvrir terminal.
    * **La souris ne marche pas** dans le terminal, il faut **utiliser les flèches**
    * Les raccourcis comme copier, coller sont différents. Ainsi **préferer le clic droit** pour voir les options disponibles.

## Téléchargement du dossier

Télécharger et executer ce [fichier d'installation](https://konsilion.nohost.me/nextcloud/s/DrQQe3W2ysy49D3){target=} dans l'emplacement où vous souhaitez installer Konnect *(ex : Bureau, Documents, etc)* :
    
* Ouvrir un terminal dans ce même emplacement
* Taper la commande suivante : `bash install.sh`

## Paramètrage initial

??? tip "Où est le fichier .env ?"

    Dans le dossier **Konnect > server > etc > .env** | Afin d'afficher les fichiers masqués suivre les instructions ci-dessous.

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

    * Ouvrir le fichier `.env` avec un éditeur de texte et **suivre les instructions**.
    * Depuis le dossier Konnect activer **Windows terminal** puis un **onglet GitBash** - [*voir tutoriel*](https://www.youtube.com/embed/zM9Mb-otqww?start=53){target=}
    * Taper la commande suivante : `bash konnect.sh` et ++enter++

=== "MacOS"
 
    * Ouvrir le fichier `.env` avec un éditeur de texte et **lire les commentaires**.
    * Ouvrir le terminal depuis le dossier Konnect
    * Taper la commande suivante : `bash konnect.sh` et ++enter++

=== "Linux"

    * Ouvrir le fichier `.env` avec un éditeur de texte et **suivre les instructions**, enregistrer.
    * Ouvrir le terminal depuis le dossier Konnect
    * Taper la commande suivante : `bash konnect.sh` et ++enter++
  

---
    
- [x] Pour commencer taper `6` pour initialiser Konnect, voilà **vous êtes Konnecté.e**

![Konnect Accueil](../../images/konnect_accueil.png)


!!! success "Etape 1/2 - Installation de Konnect terminée"
    
    **Une bonne chose de faite**, vous avez maintenant votre maison numérique Konnect. **Mais il est essentiel** que vous meubliez cette maison, il s'agit de **votre environnement**.


## Vos environnements de développement

Désormais, il vous faut **créer deux environnements**, rien de plus simple :



??? warning "Création d'environnement"

    Cette étape peut prendre un certain temps (~ 15 à 30 min) selon votre PC. Ainsi nous vous proposons **différentes options lors de leur création**. Ces dernières sont présentées **dans Konnect directement**.
    
    A l'avenir, pour créer vos environnements vous pourrez [suivre ce tutoriel](../../../tutoriels/conda/creation_environnement){target=} 


??? info "De quels environnements parlons nous ?"

    === "Les bases de Konnect"

        L'environnement suivant vous **assure le minimum** pour utiliser les services de Konnect.

        * **Nom de l'environnement** : `ke1`
        * **Cannal favoris** : `conda-forge`
        * **Packages** : `gh spyder jupyter jupyterlab nodejs mkdocs mkdocs-material mkdocs-macros-plugin mike jupyter-book`


    === "Applications Web"

        L'environnement suivant vous permet de **créer des applications Web** avec le logiciel Mercury.

        * **Nom de l'environnement** : `mercury`
        * **Cannal favoris** : `conda-forge`
        * **Packages** : `mercury jupyterlab nodejs`
        

* Dans Konnect, taper la commande `k04`
* Puis `11` afin de lancer la création des environnements de Konnect 

---

Après l'installation des deux environnements, **profiter pleinement** des [fonctionnalités de Konnect](../../fonctionnalites/interfaces). 

!!! success "Konnect est prêt à l'emploi !"


<br>

<style>
  .md-content__button {
    display: none;
  }
</style>