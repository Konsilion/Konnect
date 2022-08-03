# **Installation de Miniconda3**

Miniconda3 est un installateur minimaliste qui permet de **gérer des bibliothèques** pour développer en **Python**.

Séléctionnez votre système d'exploitation et **suivez pas à pas les instructions**. 
   

=== "Linux"

    Ci-dessous la **liste des commandes** pour installer Miniconda3:
    
    ```
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    ```
    ```
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ```
    ```
    bash Miniconda3-latest-Linux-x86_64.sh -p $HOME/miniconda3
    ```
    
    !!! tip
    
        A la fin de l'installation, il vous sera demandé : Do you wish the installer to initialize Anaconda3 by running conda init?, il est recommandé de dire : yes. Si vous entrez non, alors conda ne modifiera pas du tout vos scripts shell. Afin d'initialiser une fois le processus d'installation terminé, exécutez d'abord :
    
    ```
    source $HOME/miniconda3/bin/activate 
    ```


=== "Windows"

    

=== "MacOS"
   








<style>
  .md-content__button {
    display: none;
  }
</style>