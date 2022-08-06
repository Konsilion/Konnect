# **Installation de Konnect** - *multiplateformes*

Cette installation s'effectue en **trois étapes chronologiques** :

1. [Installer les pré-requis](#prerequis)
2. [Télécharger et paramètrer Konnect](#parametrage-initial)
3. [Définir votre environnement](#creer-vos-environnements)

---

## Prérequis

??? info "Les prérequis ?"

    Les logiciels présentés ci-dessous sont **tous nécessaires** au bon fonctionnement de Konnect. Konnect ne nécessite pas en soit d'installation, il s'agit d'une succession de scripts bash permettant l'**agancement et l'orchestration** de ces pré-requis.

=== "Windows"
  
    * Télécharger et installer [**Windows terminal**](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=fr-fr&gl=FR){target=}
    * Télécharger et installer [**GitBash**](https://git-scm.com/download/){target=} :
        * Choisir `nano` comme editeur par défaut
        * Choisir d'utiliser `Windows terminal - Add Gitbash profile to Windows terminal`
        * Choisir comme `Windows terminal` comme interface bash - **ne pas choisir MinTTY**   
    
    !!! warning
    
        **Respecter les trois points concernant GitBash**. Sans quoi des problèmes de compatibilités vont subvenir avec `gh-client`.

=== "MacOS"
  
    * Télécharger et installer [**Git**](../../tutoriels/git/installation_git){target=}

=== "Linux"

    * Télécharger et installer [**Git**](../../tutoriels/git/installation_git){target=}


* **Miniconda3** 
    * Télécharger et installer [**Miniconda3**](../../tutoriels/conda/installation_conda){target=}

* **GitHub**
    * S'enregistrer sur GitHub [**Inscription GitHub**](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F%3Cuser-name%3E%2F%3Crepo-name%3E&source=header-repo&source_repo=mljar%2Fmercury){target=}
    * Télécharger et installer [**GitHub client CLI**](https://cli.github.com/){target=}

* **Heroku**
    * S'enregistrer sur Heroku [**Inscription Heroku**](https://signup.heroku.com/login?redirect-url=https%3A%2F%2Fid.heroku.com%2Foauth%2Fauthorize%3Fclient_id%3D0ef71205-3b95-4203-a5e8-c1dbe6b06b43%26response_type%3Dcode%26scope%3Dglobal%252Cplatform%26state%3Dca7d9eda-1ef4-4f87-a140-f5486efedee2){target=}
    * Télécharger et installer [**Heroku client CLI**](https://devcenter.heroku.com/articles/heroku-cli#install-with-an-installer){target=}

!!! success "Etape 1/3 - Installations des prérequis terminées"

    **Bravo !** Vous venez de finir une bonne étape. Désormais **vous possédez tous les outils nécessaires**, mais il reste à placer Konnect par dessus, afin de vous **simplifier la vie**.

---

## Installer Konnect

### Téléchargement du dossier

!!! note "Pour débuter"

    Télécharger et extraire [**Konnect**](){target=} dans votre emplacement préféré *(ex : Bureau, Documents, etc)*

### Paramètrage initial

??? tip "Astuces pour le terminal"

    * Pour ouvrir un terminal : clic droit dans le dossier maitre, et ouvrir terminal.
    * **La souris ne marche pas** dans le terminal, il faut utiliser les flèches
    * Les raccourcis comme copier, coller sont différents. Ainsi préferer le clic droit pour voir les options disponibles.


=== "Windows"

    * Renommer le fichier `.env.example` en `.env` 
    * Ouvrir le fichier `.env` avec un éditeur de texte et **suivre les instructions**.
    * Activer GitBash dans Windows terminal - [*voir tutoriel*]()
    * Taper la commande suivante : `bash param.sh` et ++enter++

=== "MacOS"

    * Renommer le fichier `.env.example` en `.env` 
    * Ouvrir le fichier `.env` avec un éditeur de texte et **suivre les instructions**.
    * Ouvrir le terminal dans le dossier Konnect
    * Taper la commande suivante : `bash param.sh` et ++enter++

=== "Linux"

    * Renommer le fichier `.env.example` en `.env` 
    * Ouvrir ce fichier `.env` avec un éditeur de texte et **suivre les instructions**, enregistrer.
    * Ouvrir le terminal dans le dossier Konnect
    * Taper la commande suivante : `bash param.sh` et ++enter++
  
??? tip "Où est le fichier .env ?"

    === "Windows"

        Pour afficher les éléments masqués sous Windows suivez ce [lien](https://support.microsoft.com/fr-fr/windows/voir-les-fichiers-et-les-dossiers-cach%C3%A9s-dans-windows-97fbc472-c603-9d90-91d0-1166d1d9f4b5){target=}
        
    === "MacOS"
    
        Afin d'afficher les éléments masqués sous MacOS ++cmd+shift++ + .
    
    === "Linux"
    
        Afin d'afficher les éléments masqués sous Linux tapez ++ctrl++ + H
    
    
---
    
- [x] Dans le même terminal taper la commande suivante `bash konnect.sh`, voilà **vous êtes Konnecté.e**

-- *Taper directement `bash konnect.sh` pour vous connecter les prochaines fois.*

![Konnect Accueil](../images/konnect_accueil.png)

!!! success "Etape 2/3 - Paramètrage de Konnect terminé"
    
        **Une bonne chose de faite**, vous avez maintenant votre maison numérique Konnect. **Mais il est essentiel** que vous meubliez cette maison, il s'agit de **votre environnement**.


### Créer vos environnements

-- *Dernière étape ! :D*

Désormais, il vous faut **créer deux environnements** présentés ci-dessous. Pour créer un environnement **avec Konnect**, vous pouvez [suivre ce tutoriel](../../tutoriels/conda/creation_environnement)

!!! warning "Ajout conda-forge"

    Il vous faut ajouter le canal conda-forge. Pour cela, suivre ce [tutoriel](../../tutoriels/conda/ajout_channel).

=== "Bases de Konnect"

    L'environnement suivant vous **assure le minimum** pour utiliser les services de Konnect.

    * **Nom de l'environnement** : `konnect`
    * **Cannal favoris** : `conda-forge`
    * **Packages** : `gh spyder jupyter jupyterlab nodejs mkdocs mkdocs-material mkdocs-macros-plugin mike jupyter-book`


=== "Applications Web"

    L'environnement suivant vous permet de **créer des applications Web** avec le logiciel Mercury.

    * **Nom de l'environnement** : `mercury`
    * **Cannal favoris** : `conda-forge`
    * **Packages** : `mercury jupyterlab nodejs`

!!! success "Konnect est prêt à l'emploi !"

---

Vous pouvez désormais **profiter pleinement** des fonctionnalités de Konsilion - Konnect. 
    
[Vos premiers pas avec Konnect](../premiers_pas){ .md-button .md-button--primary }


<style>
  .md-content__button {
    display: none;
  }
  .md-content__button {
    display: none;
  }
</style>