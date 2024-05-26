extends CharacterBody2D

@onready var collision_shape_2d = $CollisionShape2D

@export var SPEED = 200
var direction = Vector2.ZERO
var next_direction = Vector2.ZERO
var can_control = true
var shape_query = PhysicsShapeQueryParameters2D.new()

func _ready():
	shape_query.shape = collision_shape_2d.shape
	shape_query.collision_mask = 2

func set_control(setter):
	can_control = setter

func _physics_process(delta):
	get_input()
	if can_control:
		if direction == Vector2.ZERO:
			direction = next_direction
		if can_change_direction(next_direction, delta):
			direction = next_direction
	velocity = direction * SPEED
	move_and_slide()

func get_input():
	if Input.is_action_just_pressed("up"):
		set_next_direction("up")
	if Input.is_action_just_pressed("down"):
		set_next_direction("down")
	if Input.is_action_just_pressed("left"):
		set_next_direction("left")
	if Input.is_action_just_pressed("right"):
		set_next_direction("right")

func set_next_direction(setter):
	match setter:
		"down":
			next_direction = Vector2.DOWN
		"up":
			next_direction = Vector2.UP
		"left":
			next_direction = Vector2.LEFT
		"right":
			next_direction = Vector2.RIGHT

func set_direction(setter):
	match setter:
		"down":
			direction = Vector2.DOWN
		"up":
			direction = Vector2.UP
		"left":
			direction = Vector2.LEFT
		"right":
			direction = Vector2.RIGHT

func can_change_direction(dir: Vector2, delta: float) -> bool:
	shape_query.transform = global_transform.translated(dir * SPEED * delta * 2)
	var result = get_world_2d().direct_space_state.intersect_shape(shape_query)
	return result.size() == 0
