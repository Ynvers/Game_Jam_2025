extends Control

@export var player: CharacterBody2D

var drag = false
var start_position = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch:
		drag = event.pressed
		if drag:
			start_position = event.position
	if event is InputEventScreenDrag and drag:
		var direction = (event.position - start_position)
		player.set_direction(direction)
	if event is InputEventScreenTouch and drag:
		player.set_direction(Vector2.ZERO)
