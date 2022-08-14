---
hide:
    - toc
---

# **Ajouter un package**

Les packages sont des **applications concatenées** de sorte à pouvoir être téléchargées et utilisées **d'une manière standarde**.

De **nombreux packages sont disponibles** avec Conda et donc Konnect.

??? question "Trouver une application ?"

    Si vous avez trouvé une application qui semble répondre à votre besoin, alors taper son nom dans votre moteur de recherche, et ajouter : conda package.

---

Afin d'**ajouter un package** à votre environnement actuel faite :

* Taper `k04`
* puis `4`
* et enfin entrer le `nom du package`

Si vous souhaiter enregistrer un package "peu connu" alors les **bonnes pratiques** ci-dessous peuvent être utile.

---

??? tip "Bonnes pratiques"

    Vous pouvez renseigner **uniquement le nom**, mais également renseigner d'autres **paramètres optionnels**. Par exemple :

    1. Soit simplement `jupyterlab`
    2. ou alors, `-c conda-forge jupyterlab==4.0.3`

    -- Dans le **premier cas**, le package `jupyterlab` sera télécharger dans sa `dernière version` sur un des [cannaux enregistrés](../ajout_channel).
    
    -- Pour le **second cas**, `jupyterlab` est téléchargé sur le canal `conda-forge` dans sa `version==4.0.3`


<br>


<style>
  .md-content__button {
    display: none;
  }
</style>