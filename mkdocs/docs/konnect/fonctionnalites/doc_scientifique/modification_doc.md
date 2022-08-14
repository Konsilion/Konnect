# **Personnaliser votre documentation**

Pour celles et ceux qui souhaitent aller plus loin, vous pouvez consulter ce [tutoriel concernant Jupyter Book](https://jupyterbook.org/en/stable/basics/organize.html){target=}.

---

??? tip "Où trouver les fichiers de mon JupyterBook ?"

    Lorsque vous avez **créé une documentation scientifique avec Konnect**, vous trouverez tous les documents qui y sont relatifs dans le dossier suivant **VotreProjet > JupyterBook**. `Konnect/server/lib/projects/VotreProjet/JupyterBook`
    
    !!! failure "A NE PAS FAIRE"

        * Déplacer `index.md` `_toc.yml` `_config.yml`
        * Supprimer `logo.png`, remplacer le si besoin.


## **Paramètres généraux  et organisation**



Avec **JupyterBook**, vous contrôlez :  

* Les **paramètres généraux** avec le fichier : `_config.yml`.
* L'**architecture de votre documentation** avec le fichier : `_toc.yml`. 

Des instructions y sont fournies.

*-- Pour plus d'information, vous pouvez consulter [cette documentation](https://jupyterbook.org/en/stable/structure/toc.html){target=}*



## **Votre contenu - dossier `docs`**

Le dossier `docs` concentre tout ce qu'il vous faut. Vous organisez ce dossier comme bon vous semble. Néanmoins il comporte le contenu de votre documentation alors il est préférable de penser à l'avance à comment classer vos documents.


---

!!! abstract "En résumé"

    J'enregistre mes `paramètres généraux` sur le fichier `_config.yml` (à ne faire qu'une fois)
    
    ---
    
    1. Je créé une page en `.ipynb` dans le dossier `docs` ou dans un dossier créé dans `docs`
    2. Je renseigne cette nouvelle page dans le fichier `_toc.yml`
    
    Voilà.



<style>
  .md-content__button {
    display: none;
  }
</style>