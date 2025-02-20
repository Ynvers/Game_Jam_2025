extends Control

# Associer les boutons à leurs ingrédients
var ingredients_map = {
	"Ingredient1": "vinaigre",
	"Ingredient2": "bicarbonate",
	"Ingredient3": "eau",
	"Ingredient4": "sel",
	"Ingredient5": "citron"
}

#Liste des ingrédients corrects 
const BONNE_COMBINAISON = ["vinaigre", "bicarbonate"]

#Stock les ingrédients sélectionnés
var selected_ingredients = []

func _ready():
	#Connecte dynamiquement les boutons
	for i in range(1, 6):
		var bouton = get_node("IngredientList/Ingredient"+str(i))
		bouton.connect("pressed", Callable(self, "_ajouter_ingredient").bind(bouton.name))
	print("Feedback trouvé :", $Feedback)  # Vérifie que le Label est trouvé

func _ajouter_ingredient(button_name):
	# Récupérer l'ingrédient depuis le bouton
	var  ingredient = ingredients_map.get(button_name)
	
	if len(selected_ingredients) < 2:
		selected_ingredients.append(ingredient)
		_mettre_a_jour_affichage()
		
	#Si 2 ingrédients sont sélectionnés, vérifier la combinaison
		if len(selected_ingredients) == 2:
			_verifier_combinaison()
			
func _mettre_a_jour_affichage():
	print("Ingrédients choisis :", selected_ingredients)
	$Feedback.text = "Ingrédients choisis : " + ", ".join(selected_ingredients)

func _verifier_combinaison():
	# Trie les deux tableaux pour permettre une comparaison fixe
	if selected_ingredients == BONNE_COMBINAISON:
		$Feedback.text += "\n ✅ Succès : La potion a fonctionné !"
	else:
		$Feedback.text += "\n❌ Échec : Le mélange a provoqué une explosion !"
		
	# Réinitialse la sélection après vérification
	selected_ingredients.clear()
