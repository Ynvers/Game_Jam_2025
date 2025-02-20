extends CharacterBody2D

@export var speed = 50
var direction = Vector2.ZERO

func _physics_process(delta):
	#Déplacement si il est sur mobile
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		direction.y = Input.get_axis("ui_up", "ui_down")
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		direction.x = Input.get_axis("ui_left", "ui_right")	
	
	#Normaise pour eviter d'aller plus vite en diagonale
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
