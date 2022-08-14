# **Personnaliser votre site** - *avec Konnect*

Pour celles et ceux qui souhaitent aller plus loin, vous pouvez consulter ce [tutoriel concernant mkdocs](https://squidfunk.github.io/mkdocs-material/creating-your-site/#advanced-configuration){target=}.

---

??? tip "Où trouver les fichiers de mon Site Web ?"

    Lorsque vous avez **créé un site web avec Konnect**, vous trouverez tous les documents qui y sont relatifs dans le dossier suivant **VotreProjet > mkdocs**. `Konnect/server/lib/projects/VotreProjet/mkdocs`
    
    !!! failure "A NE PAS FAIRE"

        * Déplacer `index.md` `env`
        * Supprimer `logo.png`, remplacer le si besoin.
        * Modifier ou déplacer le fichier `mkdocs.yml`

Le fichier `env` vous donne accès à de nombreux paramètres. Des instructions sont fournies en son sein et il vous suffit de les suivres.

## **Votre contenu - dossier `docs`**

Le dossier `docs` concentre tout ce qu'il vous faut. Vous organisez ce dossier comme bon vous semble. Néanmoins il comporte le contenu de votre documentation alors il est préférable de penser à l'avance à comment classer vos documents.


!!! abstract "En résumé"

    J'enregistre mes `paramètres généraux` sur le fichier `env` (à ne faire qu'une fois)
    
    ---
    
    1. Je créé une page en `.md` dans le dossier `docs` ou dans un sous-dossier créé dans `docs`
    2. Je renseigne cette nouvelle page dans le fichier `env` section `# AGANCEMENT DE VOS DOCUMENTS`
    
    Voilà.



<style>
  .md-content__button {
    display: none;
  }
</style>