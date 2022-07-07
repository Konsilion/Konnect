# Konsilion Hub - Konnect

![](https://img.shields.io/badge/Maintenu-Oui-success.svg)
![](https://img.shields.io/github/languages/top/Konsilion/MN_Analyse_Economique?style=?style=for-the-badge)
![](https://img.shields.io/github/repo-size/Konsilion/MN_Analyse_Economique?style=?style=for-the-badge)
![](https://img.shields.io/github/downloads/Konsilion/MN_Analyse_Economique/total.svg?color=fedcba)

Afin que la compr�hension des outils n'interfere pas avec la compr�hension des m�thodes.

> Important : Ceci est une version B�ta. Contactez-nous pour vous tenir inform� des futures avanc�es.

Actuellement si vous souhaitez faire de la Recherche et du D�veloppement collaboratif vous devez soit :

- **Expert** : Maitriser pleinement les outils de DataScience tels que Conda et Git. Ainsi vous utilisez directement les lignes de codes dans un terminal de commande.
- **Amateur** : Installer les GUI GitHub desktop, Anaconda, etc. Lourds et gourmands en ressources informatiques, ces logiciels peuvent �tre un frein � votre appropriation des m�thodes. 
- **N�ofite** : Utiliser **Konsilion - Konnect** afin de b�nificier des avantages Experts et Amateur sans les complications que chacun apportent. Nous vous proposons d'acc�der facilement aux fonctionnalit�s de bases des technologies de DataScience.


## Pourquoi utiliser la distribution logiciel Konnect ?

- **Combine rapidit� et l�gert�** : Par son architecture simplifi�e et inspir� des services Linux, l'application Konnect vous octroie une interface rapide � d�ployer et comportant tout ce qu'il faut pour la DataScience collaborative.
- **Appropriation de votre Hub** : Avec les mod�les de page principale et de fonction, il vous est possible de modifier le Hub selon les sp�cificit�s de votre organisation (association, laboratoire, �cole, ect).
- **Compl�mentarit�** : Des besoins sp�cifiques pour un projet, une commande non d�velopp�e encore dans Konnect, utilisez directement le terminal int�gr�.


### Fonctionnalit�s int�gr�es dans Konnect

1. **Cr�ez simplement et rapidement** vos projet ou alors importez vos projets existants.
2. **Partagez en quelques clics** votre projet sur le 'cloud' avec ++GitHub++ (n�cessite un compte GitHub) [en savoir plus](https://github.com)
3. **Importez ou cr�ez un environnement de d�veloppement** � l'aide de ++miniconda3++ [en savoir plus](https://docs.conda.io/en/latest/miniconda.html)
3. **R�digez et partagez votre documentation** collaborative sur le Web � l'aide de ++Mkdocs++ [en savoir plus](https://mkdocs.com)
4. **D�veloppez vos applications** avec vos logiciels de DataScience pr�f�r�s (Jupyter, Spyder, etc.) install�es avec miniconda3.


## Installer Konnect

### T�l�chargement et installations des logiciels supports

* ++Windows++ :
- T�l�charger et installer `Windows terminal` : Sur le Windows store directement
- T�l�charger et installer `gitbash` : https://git-scm.com/download/
    - Tutoriel complet [Lien du tutoriel]()
    1. Choisir `nano` comme editeur par d�faut (sauf si vous pr�f�rez un autre �diteur de terminal tels que `vim`)
    2. Choisir utiliser Windows terminal - Add Gitbash profile to Windows terminal
    3. NE PAS CHOISIR MinTTY comme interface bash mais Windows terminal (MinTTY poss�de des bugs d'affichage avec le package `gh`)

* ++Linux++ :
- T�l�chager et installer `git` : dans le terminal taper `sudo apt install git`

* ++Pour tous++ :
- T�l�charger et installer `miniconda3` : [Lien de t�l�chargement](https://docs.conda.io/en/latest/miniconda.html)
- T�l�charger et installer `gh client CLI` : [Lien de t�l�chargement](https://cli.github.com/)


### Param�trage de Konnect

- Editer le fichier `.env.example` et l'enregistrer sous le nom `.env`
- Editer le fichier `functions.sh` et enregistrer.

---

### Les premiers pas ++essentiels++

- Acc�der � vos environnements de d�veloppement : Taper `k04` dans la page d'accueil
- Ajouter le canal de t�l�chargement : `conda-forge`
- Cr�er environnement avec les packages suivants : `spyder jupyter jupyterlab mkdocs gh` (pour les essentiels du Hub)
- Activer votre nouvel environnement

Vous pouvez d�sormais profitez, dans cet environnement, pleinement des fonctionnalit�s de Konsilion - Konnect.

> Pour aller plus loin, rendez-vous dans la documentation. [Lien vers la documentation](https://konsilion.github.io/Konnect)

---

## Documentation et ressources

* Documentation officielle : [Lien vers la documentation](https://konsilion.github.io/Konnect)
* Reporter une erreur : [Y acc�der](https://github.com/Konsilion/Konnect/issues)
* Site web de Konsilion : [Lien vers le site de Konsilion](https://konsilion.fr/wp/recherche-et-developpement)

---

Ce document est r�gi par les termes de la licence juridique [Creative Commons CC-BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.fr) 

<img style="display: center; margin: 0 auto;" src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-nc.png" width="20%">
