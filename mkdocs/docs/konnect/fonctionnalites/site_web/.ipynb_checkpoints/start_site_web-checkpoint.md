# **Créer votre site internet** - *avec Konnect*

Konnect vous propose de créer un **site internet gratuitement** en **moins de 5 minutes**. Cette technologie repose sur `mkdocs` et `mike` pour l'essentiel. 

Nous vous proposons de suivre les quatres étapes suivantes afin de créer votre site internet :


* [Créer votre site](#creation-et-initialisation)
* [Modifiez le visualisez en direct le résultat](#visualisation-et-modifications)
* [Publier la première version de votre site](#publication-de-votre-site)


??? info "Site internet ou Documentation scientifique ?"

    Pour un projet il s'agit de créer un site internet **ou** une documentation scientifique. Il n'est **pas possible d'attribuer les deux** pour un même projet Konnect.
    
    -- **Astuce** : Pour vos projets nécessitants les deux alors créer un projet `mon_projet_site` et `mon_projet` 


## **Création et initialisation**

Dans Konnect taper successivement les **commandes suivantes** :

* `k01`
* `24. Créer site Web` 

!!! success "Création en local terminée"
    
## **Visualisation et modifications**

Afin de **visualiser votre site internet**, taper successivement les **commandes suivantes** :

* `k01`
* `3. Ouvrir`
* et dans votre navigateur internet entrer l'adresse suivante : `http://localhost:8000`

Pour **modifier votre site internet**, taper successivement les **commandes suivantes** 

* `k01`
* `3. Modifier` et attendre que la page de `jupyter lab` s'ouvre.

!!! success "Site internet prêt"

## **Publication de votre site Web**


???+ warning "Prérequis - avoir un répertoire en ligne"

    Pour **publier votre site web**, votre projet actuel doit avoir répertoire distant. Si à côté de dossier local vous avez **`Dépôt en ligne`** alors vous pouvez continuer, sinon :
    
    * Taper `k02`
    * puis `1` pour créer un répertoire.




Pour **publier votre site**, rien de plus simple, il suffit de taper :

* `k01`
* `6. Ajouter`
    * `2) Créer une nouvelle version`
    * `nom de la version` ce que vous voulez, `0.0.1` est un bon début
    * `2) Publier en ligne`

!!! success "Votre site internet est en ligne"

    Pour consulter votre site internet, **taper l'adresse suivante** : 
    
    -- *https://`<user_name_github>`.github.io/`<nom_repertoire_github>`/latest*

<style>
  .md-content__button {
    display: none;
  }
</style>