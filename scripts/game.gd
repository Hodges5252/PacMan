extends Node2D


func _on_world_boundry_body_exited(body):
	body.global_position = Vector2(316, 487)
	print(str(body.name) + " tried to escape")
