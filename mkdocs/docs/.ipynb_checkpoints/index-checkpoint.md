---
hide:
  - navigation
  - toc
---



# **Konnect** - Vos projets de A à Z.

Du traitement à la valorisation de vos savoirs, embarquez de nombreuses solutions et outils **utiles à la gestion et au développement de vos projets**.

---

* Site Web en **quelques minutes**

* Documentation **collaborative**

* Technologies de **Data Science**

* **Pas de serveur** à gérer

## *Produire et partager les connaissances.*

---



[Présentation de Konnect](./konnect/presentation_konnect){ .md-button .md-button--primary } [Installation](./konnect/guide_installation/prerequis){ .md-button .md-button--primary } [Premiers Pas](./konnect/fonctionnalites/interfaces/){ .md-button .md-button--primary }

---





![](https://img.shields.io/badge/Maintenu-Oui-success.svg) ![](https://img.shields.io/github/repo-size/Konsilion/Konnect?style=?style=for-the-badge)





---

[comment]: <> (source du code html : https://codepen.io/plvrilde/pen/qBxYRWq)

<html>
<head>
<link rel="stylesheet" href="../../_css/form.css" />
</head>

<body>
<div class="container">
		<header class="header">
			<h2 id="title" class="text-center">
				Prendre contact
			</h2>
			<p id="description" class="description text-center">
			</p>
		</header>   
		<form id="survey-form" action="https://formspree.io/f/xnqrqwpo" method="POST">	
			<div class="form-group">
				<label id="name-label" for="name">
					Prénom et NOM
				</label>
				<input type="text" name="name" id="name" class="form-control" placeholder="" required/>
        		</div>
			
			<div class="form-group">
				<label id="email-label" for="email">
					Email
				</label>
				<input type="email" name="email" id="email" class="form-control" placeholder="" required/>
			</div>
			

			<div class="form-group">
				<p>
					Quel est le sujet de votre contact ?
				</p>
			
				<select id="most-like" name="mostLike" class="form-control" required>
					
					<option disabled selected value>
						Liste des choix :
					</option>
					
					<option value="Deployement">
						Je souhaite déployer Konnect
					</option>
					
					<option value="Installation">
						Installation
					</option>
					
					<option value="utilisation">
						Utilisation
					</option>
					
					<option value="appropriation">
						Appropriation
					</option>			
				</select>
			</div>
			
			<div class="form-group">
				<p>
					Quel message à nous délivrer donc ? 😀
				</p>
				
				<textarea id="comments" class="input-textarea" name="comment" placeholder="Écrire ici ...">
				</textarea>
			</div>
			
			<div class="form-group">
				<button type="submit" id="submit" class="submit-button">
					Envoyer
				</button>
			</div>

		</form>
	</div>

	</body>
</html>


<br><br>


<html lang="en">
<head>
	<link rel = "stylesheet" href = "./_css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
</head>
    <body>
        <div>
            <i class="center fas fa-heart" aria-hidden="true"></i>
        </div>
    </body>
</html>














<style>
    
/* Delete edit button on page */
  
  .md-content__button {
    display: none;
  }
    

/* Modify background */    
    
   body{margin-top:0px;
        background:#f7f7f7;
    }

    
    
/* Create three equal columns that floats next to each other */
    
    .column_catalog {
        border-radius: 5px;
        border: 1px solid white;
        background: rgba(255, 255, 255, 0.2);
    }
    
    .column_catalog:hover {
        background: rgba(255, 255, 255, 0.8);
    }  
    
    

/*
* @subsection Shop
*/
    .product.tumbnail {
        box-shadow: 0 5px 25px 0 transparent;
        transition: 0.3s linear;
        padding-top: 25px;
        margin: 0;
        
    }

    .product.tumbnail img:hover {
        box-shadow: 0 5px 25px 0 rgba(0, 0, 0, 0.2);
    }
    

.grid-container {
  display: grid;
  grid-template-columns: 33% 32% 32%;
  gap: 15px;
  background-color: rgba(255, 255, 255, 0);
  padding: 10px;
}
    
    
.grid-container > div {
  text-align: center;
  font-size: 20px;
}
    

</style>



<html>
<head>
<link rel="stylesheet" href="../_css/accueil.css" />
</head>
</html>