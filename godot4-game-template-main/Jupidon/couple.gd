extends Area2D

@export var attempts: int = 3

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	print(body.solution)
	var message = get_parent().get_node("DialogueBox")

	# Si les tentatives sont épuisées, afficher Game Over et désactiver
	if attempts == 0:
		message.text = "Game Over"
		set_deferred("monitoring", false)  # Désactive la détection de collision
		return
	
	# Vérifie si la solution est trouvée
	if body.solution == true:
		print(body.solution)
		message.text = "Vous avez sauvez le couple"
	else:
		attempts -= 1
		message.text = "Il vous reste %d essai(s) possible(s)" % attempts
