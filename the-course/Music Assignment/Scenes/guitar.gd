extends Node2D

var low_e_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-e-note-low.wav")
var a_string_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-a-note-straight.wav")
var d_string_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-d-note-regolar.wav")
var g_string_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-g-note-clean-low.wav")
var b_string_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-b-note-low.wav")
var high_e_sound = preload("res://Music Assignment/Sounds/acoustic-guitar-string-e-note-high.wav")


func _on_button_low_e_pressed() -> void:
	play_sound(low_e_sound)


func _on_button_a_pressed() -> void:
	play_sound(a_string_sound)


func _on_button_d_pressed() -> void:
	play_sound(d_string_sound)

func _on_button_g_pressed() -> void:
	play_sound(g_string_sound)

func _on_button_b_pressed() -> void:
	play_sound(b_string_sound)

func _on_button_high_e_pressed() -> void:
	play_sound(high_e_sound)


func play_sound(sound: AudioStream):
	var audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = sound
	audio_player.play()
