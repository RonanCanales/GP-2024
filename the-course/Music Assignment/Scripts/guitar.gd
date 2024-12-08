extends Node2D

#Guitar Strings
var low_e_sound = preload("res://Music Assignment/Strings sounds/acoustic-guitar-string-e-note-low.wav")
var a_string_sound = preload("res://Music Assignment/Strings sounds/acoustic-guitar-string-a-note-straight.wav")
var d_string_sound = preload("res://Music Assignment/Strings sounds/acoustic-guitar-string-d-note-regolar.wav")
var g_string_sound = preload("res://Music Assignment/Strings sounds/acoustic-guitar-string-g-note-clean-low.wav")
var b_string_sound = preload("res://Music Assignment/Strings sounds/acoustic-guitar-string-b-note-low.wav")
var high_e_sound = preload("res://Music Assignment/Strings sounds/acoustic-guitar-string-e-note-high.wav")
var FEIN_X_NOKIA = preload("res://Music Assignment/Chord  sounds/fein-x-nokia.mp3")

@onready var volume_slider: HSlider = $VolumeSlider
@onready var reverb_slider: HSlider = $ReverbSlider
@onready var distortion_slider: HSlider = $DistortionSlider
@onready var chorus_slider: HSlider = $ChorusSlider


#Guitar Chords
var c_major = preload("res://Music Assignment/Chord  sounds/17569__danglada__c-major-[AudioTrimmer.com].wav")
var g_major = preload("res://Music Assignment/Chord  sounds/17573__danglada__g-major-[AudioTrimmer.com].wav")
var f_major = preload("res://Music Assignment/Chord  sounds/17572__danglada__f-major-[AudioTrimmer.com].wav")
var d_major = preload("res://Music Assignment/Chord  sounds/17570__danglada__d-major-[AudioTrimmer.com].wav")
var a_major = preload("res://Music Assignment/Chord  sounds/17567__danglada__a-major-[AudioTrimmer.com].wav")
var b_major = preload("res://Music Assignment/Chord  sounds/17568__danglada__b-major-[AudioTrimmer.com].wav")

var reverb_effect = AudioEffectReverb.new()
var distortion_effect = AudioEffectDistortion.new()
var chorus_effect = AudioEffectChorus.new()


#STRINGS
func _on_button_low_e_pressed() -> void:
	play_sound(low_e_sound, volume_slider.value)

func _on_button_a_pressed() -> void:
	play_sound(a_string_sound, volume_slider.value)

func _on_button_d_pressed() -> void:
	play_sound(d_string_sound, volume_slider.value)

func _on_button_g_pressed() -> void:
	play_sound(g_string_sound, volume_slider.value)

func _on_button_b_pressed() -> void:
	play_sound(b_string_sound, volume_slider.value)

func _on_button_high_e_pressed() -> void:
	play_sound(high_e_sound, volume_slider.value)







#CHORDS
func _on_button_c_chord_pressed() -> void:
	play_sound(c_major, volume_slider.value)


func _on_button_g_major_pressed() -> void:
	play_sound(g_major, volume_slider.value)


func _on_button_f_major_pressed() -> void:
	play_sound(f_major, volume_slider.value)


func _on_button_d_major_pressed() -> void:
	play_sound(d_major, volume_slider.value)

func _on_button_a_major_pressed() -> void:
	play_sound(a_major, volume_slider.value)


func _on_button_b_major_pressed() -> void:
	play_sound(b_major, volume_slider.value)


func play_sound(sound: AudioStream, volume: float):
	var audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = sound
	audio_player.volume_db = linear_to_db(volume)
	audio_player.play()



func _on_button_pressed() -> void:
	if $AudioStreamPlayer2D.playing:
		$Button.text = "Oh yeah"
		$AudioStreamPlayer2D.stop()
	else:
		$AudioStreamPlayer2D.stream = FEIN_X_NOKIA
		$AudioStreamPlayer2D.volume_db = linear_to_db(volume_slider.value)
		$Button.text = "Stop"
		$AudioStreamPlayer2D.play()
