extends AnimatedSprite2D

@export var is_player : bool
@export var object : CharacterBody2D

func _process(delta):
	if is_player:
		if object.direction == Vector2.UP:
			play("up")
		elif object.direction == Vector2.DOWN:
			play("down")
		elif object.direction == Vector2.LEFT:
			play("left")
		elif object.direction == Vector2.RIGHT:
			play("right")
