---
hide:
  -toc
---

# Contacts


**Nicolas Brémond**

* <u>E-mail</u> : nicolasbremond@konsilion.fr

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



<br> 

<style>
  .md-content__button {
    display: none;
  }
</style>




---

*Afin que la compréhension des outils n'interfère pas avec l'acquisition des méthodes*

<style>
  .md-content__button {
    display: none;
  }
</style>