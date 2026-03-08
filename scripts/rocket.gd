extends Area2D

@export var speed = 300

func _physics_process(delta: float) -> void:
	global_position.x += speed*delta

func _on_visible_notifier_screen_exited() -> void:
	queue_free()
