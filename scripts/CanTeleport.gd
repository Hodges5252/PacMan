extends Area2D

@export var object_collision : CollisionShape2D
@export var object : CharacterBody2D

var start_process = false
var end_process = false


func _on_area_entered(area):
	if start_process:
		end_process = true
	else:
		if object.has_method("set_control"):
			object.set_control(false)
		start_process = true

func _on_area_exited(area):
	if end_process:
		if object.has_method("set_control"):
			object.set_control(true)
		start_process = false
		end_process = false
