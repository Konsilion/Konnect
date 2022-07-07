# Konsilion Hub - Konnect

![](https://img.shields.io/badge/Maintenu-Oui-success.svg)
![](https://img.shields.io/github/languages/top/Konsilion/Konnect?style=?style=for-the-badge)
![](https://img.shields.io/github/repo-size/Konsilion/Konnect?style=?style=for-the-badge)
![](https://img.shields.io/github/downloads/Konsilion/Konnect/total.svg?color=fedcba)

> Important : Ceci est une version Bêta. Contactez-nous pour vous tenir informé des futures avancées.

*Afin que la compréhension des outils n'interfere pas avec la compréhension des méthodes.*

Actuellement si vous souhaitez faire de la Recherche et du Développement collaboratif vous devez soit :

- **Expert** : Maitriser pleinement les outils de DataScience tels que Conda et Git. Ainsi vous utilisez directement les lignes de codes dans un terminal de commande.
- **Amateur** : Installer les GUI GitHub desktop, Anaconda, etc. Lourds et gourmands en ressources informatiques, ces logiciels peuvent être un frein à votre appropriation des méthodes. 
- **Néofite** : Utiliser **Konsilion - Konnect** afin de bénificier des avantages Experts et Amateur sans les complications que chacun apportent. Nous vous proposons d'accèder facilement aux fonctionnalités de bases des technologies de DataScience.


## Pourquoi utiliser la distribution logiciel Konnect ?

- **Combine rapidité et légerté** : Par son architecture simplifiée et inspiré des services Linux, l'application Konnect vous octroie une interface rapide à déployer et comportant tout ce qu'il faut pour la DataScience collaborative.
- **Appropriation de votre Hub** : Avec les modèles de page principale et de fonction, il vous est possible de modifier le Hub selon les spécificités de votre organisation (association, laboratoire, école, ect).
- **Complémentarité** : Des besoins spécifiques pour un projet, une commande non développée encore dans Konnect, utilisez directement le terminal intégré.


### Fonctionnalités intégrées dans Konnect

1. **Créez simplement et rapidement** vos projet ou alors importez vos projets existants.
2. **Partagez en quelques clics** votre projet sur le 'cloud' avec ++GitHub++ (nécessite un compte GitHub) [en savoir plus](https://github.com)
3. **Importez ou créez un environnement de développement** à l'aide de ++miniconda3++ [en savoir plus](https://docs.conda.io/en/latest/miniconda.html)
3. **Rédigez et partagez votre documentation** collaborative sur le Web à l'aide de ++Mkdocs++ [en savoir plus](https://mkdocs.com)
4. **Développez vos applications** avec vos logiciels de DataScience préférés (Jupyter, Spyder, etc.) installées avec miniconda3.


## Installer Konnect

### Téléchargement et installations des logiciels supports

* *Windows* :
- Télécharger et installer `Windows terminal` : Sur le Windows store directement
- Télécharger et installer `gitbash` : https://git-scm.com/download/
    - Tutoriel complet [Lien du tutoriel]()
    1. Choisir `nano` comme editeur par défaut (sauf si vous préférez un autre éditeur de terminal tels que `vim`)
    2. Choisir utiliser Windows terminal - Add Gitbash profile to Windows terminal
    3. NE PAS CHOISIR MinTTY comme interface bash mais Windows terminal (MinTTY possède des bugs d'affichage avec le package `gh`)

* *Linux* :
- Téléchager et installer `git` : dans le terminal taper `sudo apt install git`

* *Pour tous* :
- Télécharger et installer `miniconda3` : [Lien de téléchargement](https://docs.conda.io/en/latest/miniconda.html)
- Télécharger et installer `gh client CLI` : [Lien de téléchargement](https://cli.github.com/)


### Paramètrage de Konnect

- Editer le fichier `.env.example` et l'enregistrer sous le nom `.env`
- Editer le fichier `functions.sh` et enregistrer.

---

### Les premiers pas **essentiels**

- Accèder à vos environnements de développement : Taper `k04` dans la page d'accueil
- Ajouter le canal de téléchargement : `conda-forge`
- Créer un environnement avec les packages suivants : `spyder jupyter jupyterlab mkdocs gh` (pour les essentiels du Hub)
- Activer votre nouvel environnement

Vous pouvez désormais profitez, dans cet environnement, pleinement des fonctionnalités de Konsilion - Konnect.

---

## Documentation et ressources

* Documentation officielle : [Bientôt disponible]()
* Reporter une erreur : [Y accèder](https://github.com/Konsilion/Konnect/issues)
* Site web de Konsilion : [Lien vers le site de Konsilion](https://konsilion.fr/wp/recherche-et-developpement)

---

Ce document est régi par les termes de la licence juridique [Creative Commons CC-BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.fr) 

<img style="display: center; margin: 0 auto;" src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-nc.png" width="20%">
