extends Node2D

var low_e_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-e-note-low.wav")

func _on_button_low_e_pressed() -> void:
	var audio_player = AudioStreamPlayer.new()
	add_child(audio_player)  # Add it to the scene
	audio_player.stream = low_e_sound
	audio_player.play()
