extends Area2D

@export var description = "Un niveau inconnu"

func _ready():
	# Assure-toi que chaque niveau est bien dans un groupe
	print("Niveau chargé : ", name)
	add_to_group("Niveaux")

# Assombrit le niveau en baissant l'opacité
func assombrir():
	modulate = Color(0.5, 0.5, 0.5, 1)

# Retourne la description du niveau
func get_description():
	return "🎮 " + description


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("Players"):
		print("Entré dans un niveau valide :", self.name)
		assombrir()
		
		get_parent()
		var feedback_label = get_parent().get_parent().get_node("FeedBack")
		if feedback_label:
			feedback_label.text = get_description()
		else:
			print("Le nœud FeedBack n'a pas été trouvé ou n'est pas un Label !")
		load_level_after_delay()

func load_level_after_delay():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/jupidon_lab.tscn")
