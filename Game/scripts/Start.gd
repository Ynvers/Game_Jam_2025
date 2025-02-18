extends Button

func _ready():
	connect("pressed", Callable(self, "_on_start_pressed"))
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/map.tscn")
