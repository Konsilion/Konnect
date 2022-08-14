---
hide:
    - toc
---


# **Les essentiels de Konnect**

Les applications présentées ci-dessous sont **toutes nécessaires** au bon fonctionnement de Konnect.

* Git gère la **mise en commun des projets, données, etc** sous la forme d'un **serveur distribué**.
* Conda génère pour vous des **environnement de développement**. Cela assure la compatibilité entre nos **différents ordinateurs** et leur environnement (logiciels, version, etc)
* `Windows` Les prérequis supplémentaires sont utiles à l'**harmonisation de votre PC** avec Linux et Mac.


!!! info "Konnect ~ Orchestrateur des pré-requis"
    Konnect ne nécessite pas d'installation en soit , il s'agit d'une succession de scripts bash permettant l'**agancement et l'orchestration** de ces pré-requis.


## **Installation des prérequis**



=== "Linux"

    **Git**

    * Télécharger et installer [**Git**](../../../tutoriels/git/installation_git){target=}

=== "Windows"

    **Git(Bash)**

    !!! warning
    
        **Respecter les deux points concernant GitBash**. Sans quoi des problèmes de compatibilités vont subvenir.

  
    * Télécharger et installer [**Windows terminal**](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=fr-fr&gl=FR){target=}
    * Télécharger et installer [**GitBash**](https://git-scm.com/download/){target=} :
        * Choisir d'utiliser `Windows terminal - Add Gitbash profile to Windows terminal`
        * Choisir comme `Windows terminal` comme interface bash - **ne pas choisir MinTTY** 
    
    Laisser le **reste des options par défaut** `third party software,bundled openSSH, OpenSSL library, line ending conversions, Git credential manager, File system caching, no experimental option, etc)`
    
=== "MacOS"
    
    **Git**
    
    * Télécharger et installer [**Git**](../../../tutoriels/git/installation_git){target=}



**Miniconda3** 
    
* Télécharger et installer [**Miniconda3**](../../../tutoriels/conda/installation_conda){target=}

**GitHub**

* S'enregistrer sur GitHub [**Inscription GitHub**](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F%3Cuser-name%3E%2F%3Crepo-name%3E&source=header-repo&source_repo=mljar%2Fmercury){target=}

**Heroku**

* S'enregistrer sur Heroku [**Inscription Heroku**](https://signup.heroku.com/login?redirect-url=https%3A%2F%2Fid.heroku.com%2Foauth%2Fauthorize%3Fclient_id%3D0ef71205-3b95-4203-a5e8-c1dbe6b06b43%26response_type%3Dcode%26scope%3Dglobal%252Cplatform%26state%3Dca7d9eda-1ef4-4f87-a140-f5486efedee2){target=}
* Télécharger et installer [**Heroku client CLI**](https://devcenter.heroku.com/articles/heroku-cli#install-with-an-installer){target=}

---

!!! success "Installations des prérequis terminées"

    **Bravo !** Vous venez de finir une bonne étape. Désormais **vous possédez tous les outils nécessaires**, mais il reste à installer Konnect par dessus, afin de vous **simplifier la vie**.

<br>

<style>
  .md-content__button {
    display: none;
  }
</style>