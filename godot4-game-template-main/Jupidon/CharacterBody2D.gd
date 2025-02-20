extends CharacterBody2D

@export var speed = 200
var direction = Vector2.ZERO
@export var solution = false
@export var ingredients = []

func _physics_process(delta):
	#Déplacement si il est sur mobile
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		direction.y = Input.get_axis("ui_up", "ui_down")
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		direction.x = Input.get_axis("ui_left", "ui_right")	
	if is_on_floor():
		velocity = Vector2.ZERO
	#Normaise pour eviter d'aller plus vite en diagonale
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
	if len(ingredients) == 2:
		_find_solution()

func _find_solution():
	var dialogue = get_parent().get_node("DialogueBox")
	if "Vinaigre" in ingredients and "Bicarbonate" in ingredients:
		solution = true
		dialogue.text = "Vous avez trouver le bon mélange, allez vers le couple"
	else:
		dialogue.text = "ressayer"
		ingredients = []
