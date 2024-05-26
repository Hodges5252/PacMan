extends Node

var tracking_init = false

func get_map_status():
	return tracking_init

func set_map_status(status):
	tracking_init = status
