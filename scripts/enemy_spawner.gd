extends Node2D

signal enemy_spawned(enemy_instance)

var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions.get_children()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_instance)
	#add_child(enemy_instance)
