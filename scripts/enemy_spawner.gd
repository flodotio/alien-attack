extends Node2D

signal enemy_spawned(enemy_instance)
signal moving_enemy_spawned(enemy_instance)

@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var moving_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions.get_children()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_instance)


func _on_timer_moving_enemy_timeout() -> void:
	var enemy_instance = moving_enemy_scene.instantiate()
	emit_signal("moving_enemy_spawned", enemy_instance)
