# **Personnaliser votre documentation** - *avec Konnect*

Pour celles et ceux qui souhaitent aller plus loin, vous pouvez consulter ce [tutoriel concernant Jupyter Book](https://jupyterbook.org/en/stable/basics/organize.html){target=}.

---


## Paramètres généraux

Avec **JupyterBook**, vous modifiez vos paramètres généraux avec `_config.yml`. Des **instructions sont fournies** en son sein et il vous suffit de les suivres.



## Table des matières et agancement

Avec JupyterBook, vous indiquez l'architecture de votre documentation avec le fichier `_toc.yml`. Des instructions sont fournies en son sein et il vous suffit de les suivres.

-- Pour plus d'information, vous pouvez consulter [cette documentation](https://jupyterbook.org/en/stable/structure/toc.html){target=}



## Votre contenu - dossier `docs`

Le dossier `docs` concentre tout ce qu'il vous faut. Vous organisez ce dossier comme il vous chante, néanmoins :

???+ failure "A NE PAS FAIRE"

    * Déplacer `index.md` `_toc.yml` `_config.yml`
    * Supprimer `logo.png`, remplacer le si besoin.

---

!!! abstract "En résumé"

    J'enregistre mes `paramètres généraux` sur le fichier `_config.yml` (à ne faire qu'une fois)
    
    ---
    
    1. Je créé une page en `.ipynb` dans le dossier `docs` ou dans un dossier créé dans `docs`
    2. Je renseigne cette nouvelle page dans le fichier `_toc.yml`
    
    Voilà.


## Un bon exemple


Vous pouvez [consulter le dossier `docs` de la documentation de MethaConcept](https://github.com/Konsilion/MethaConcept/tree/dev/JupyterBook/docs){target=} pour vous rendre compte de **ce qui a été fait et comment**.




<style>
  .md-content__button {
    display: none;
  }
</style>