---
hide:
    - toc
---

# **Installation de Git et GitHub CLI**



=== "Git et Konnect"

    Git est un logiciel de **gestion de versions décentralisé**. C'est un logiciel libre et gratuit, créé en 2005. Depuis Git est un incoutournable du travail collaboratif en informatique.
    Git est une brique essentiel de Konnect, c'est elle qui permet la **diffusion de vos projets**, en autre, mais également leurs **versions et historique**.

    Lorsqu'un projet (dossier) est **connecté avec Git**, alors il est possible de faire de nombreuses choses. Néanmoins, avec Konnect concentré vous sur l'essentiel :

    1. Créer un **répertoire en ligne** depuis un dossier local
    2. **Ajouter une branche** afin d'isoler vos modifications
    3. **Actualiser votre projet** local depuis le répertoire en ligne avec les éventuelles modification effectuées par d'autres.
    4. **Envoyer vos modifications** présentes en local sur la **branche active** du répertoire en ligne



=== "Mieux comprendre"

    
    !!! question ""
    
        **Essayons avec une histoire d'arbre**
    
        Il était une fois l'histoire d'une **jeune pousse** [^1], qui de sa seul tige devint l'arbre le plus haut de la canopé. Ses **branches** et ses feuilles **transmettaient** aux **tronc** et racines, le nécessaire au développement de cette jeune pousse.  

        Dans la forêt que serait git, votre projet serait un arbre.
        
        * Une feuille serait votre **action** sur le projet. Par exemple, modifier, créer ou supprimer un fichier ou dossier.
        * Cette intervention **s'intègre à une branche**. La branche collecte toute les actions afin de transmettres leur contenu au tronc.
        * Ainsi, tronc est cette branche maitresse (master) qui collecte toute les branches, afin de faire grandir le projet, l'arbre.


[^1]: On parle d'arbre mais en soit, Git n'est ni vert ou écolo.

---



=== "Windows"

    !!! warning "Particularités Windows"
    
        * Télécharger et installer [**Windows terminal**](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=fr-fr&gl=FR){target=}
        * Télécharger et installer [**GitBash**](https://git-scm.com/download/){target=} (suivre la vidéo ci-dessous **mais**) :
            * Choisir `nano` comme editeur par défaut et non vim.
            * Choisir d'utiliser `Windows terminal - Add Gitbash profile to Windows terminal`
            * Choisir `Windows terminal` comme interface bash - **ne pas choisir MinTTY**  

    <iframe width="560" height="315" src="https://www.youtube.com/embed/Ysv3RDGXwtY?start=52" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    
 
    
    
=== "MacOS"
   
    <iframe width="560" height="315" src="https://www.youtube.com/embed/g_l9W4FAfjI?start=52" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


=== "Linux"

    <iframe width="560" height="315" src="https://www.youtube.com/embed/b6o_Lgw-A88?start=52" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>












## Initialiser Git et GitHub CLI








??? tip "Konnect ne 'Merge' pas"

    La possibilité de **fusionner une branche** diverse avec la branche principale (master) n'est pas disponible. Cette **action engageante** de par sa nature, nous vous proposons de vous informer sur quand, comment et pourquoi faire un 'merge'.
    
    A l'avenir peut être que cette option serait être intégrée. [Dites le nous](../../../informations/contacts) si elle vous manque.



<style>
  .md-content__button {
    display: none;
  }
</style>