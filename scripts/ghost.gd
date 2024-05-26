extends CharacterBody2D

@export var tilemap: TileMap
@export var goal_point: Node2D
@export var panic_point: Marker2D
@export var home_point: Marker2D

var current_path: Array[Vector2i]

var command = "attack"

var SPEED = 2


func _process(delta):
	if Manager.get_map_status():
		set_goal(command)
		
		if current_path.is_empty():
			return
		
		var target_position = tilemap.map_to_local(current_path.front())
		global_position = global_position.move_toward(target_position, SPEED)
		
		if global_position == target_position:
			current_path.pop_front()
	else:
		return

func set_goal(objective):
	match objective:
		"idle":
			pass
		"attack":
			var goal = goal_point.get_global_position()
			current_path = tilemap.astar.get_id_path(tilemap.local_to_map(global_position), tilemap.local_to_map(goal)).slice(1)
			#print("objective at: " + str(goal))
			#print("path: " + str(current_path))
		"panic":
			pass
		"retreat":
			pass
