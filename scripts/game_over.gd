extends Control


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()

func set_score(score):
	$Panel/Score.text = "SCORE: " + str(score)
