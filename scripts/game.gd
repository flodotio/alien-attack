extends Node2D

@export var lives = 3
@export var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

var game_over_scene = preload("res://scenes/game_over.tscn")

func _ready():
	hud.set_score_label(score)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()
	
	if lives > 0:
		take_damage()

func _on_player_took_damage() -> void:
	take_damage()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)

func take_damage():
	if lives > 0:
		lives -= 1
		
	if lives == 0:
		game_over()
		
	hud.set_lives_label(lives)

func game_over():
	player.die()
	await get_tree().create_timer(0.5).timeout
	var game_over_screen = game_over_scene.instantiate()
	game_over_screen.set_score(score)
	ui.add_child(game_over_screen)
