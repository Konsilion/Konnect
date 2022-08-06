# **Personnaliser votre site** - *avec Konnect*

Pour celles et ceux qui souhaitent aller plus loin, vous pouvez consulter ce [tutoriel concernant mkdocs](https://squidfunk.github.io/mkdocs-material/creating-your-site/#advanced-configuration){target=}.

---

## Docs - un dossier pour les gouverner tous

Le dossier `docs` concentre tout ce qu'il vous faut. Vous organisez ce dossier comme il vous chante, néanmoins :

???+ failure "A NE PAS FAIRE"

    * Déplacer `env`, `index.md`
    * Supprimer `logo.png`, remplacer le si besoin.
    * Modifier ou déplacer le fichier `mkdocs.yml`

---


Le fichier `env` vous donne accès à de nombreux paramètres. Des instructions sont fournies en son sein et il vous suffit de les suivres.


!!! abstract "En résumé"

    J'enregistre mes `paramètres généraux` sur le fichier `env` (à ne faire qu'une fois)
    
    ---
    
    1. Je créé une page en `.md` dans le dossier `docs` ou dans un dossier créé dans `docs`
    2. Je renseigne cette nouvelle page dans le fichier `env` section `# AGANCEMENT DE VOS DOCUMENTS`
    
    Voilà.


## Un bon exemple


Vous pouvez [consulter le dossier `docs` de ce site internet](https://github.com/Konsilion/Konnect/tree/dev/mkdocs/docs){target=} pour vous rendre compte de **ce qui a été fait et comment**.




<style>
  .md-content__button {
    display: none;
  }
</style>