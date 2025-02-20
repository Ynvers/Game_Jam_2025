extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var ingredients = body.ingredients
	if "Bicarbonate" in ingredients:
		pass
	else:
		ingredients.append("Bicarbonate")
	print(body.ingredients)
