extends CharacterBody2D

signal took_damage

# Init variables
@export var speed = 300

var rocket_scene = preload("res://scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer

func _ready():
	pass

func _process(delta):
	shoot_rocket()

func _physics_process(delta: float) -> void:

	# Player movement
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	
	move_and_slide()
	global_position = global_position.clamp(Vector2(0,0), get_viewport_rect().size)

func shoot_rocket():
	if Input.is_action_just_pressed("shoot"):
		var rocket_instance = rocket_scene.instantiate()
		rocket_container.add_child(rocket_instance)
		rocket_instance.global_position = Vector2(global_position.x + 70, global_position.y)

func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
	
