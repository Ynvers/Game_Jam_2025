extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var ingredients = body.ingredients
	if "Vinaigre" in ingredients:
		pass
	else:
		ingredients.append("Vinaigre")
	print(body.ingredients)

