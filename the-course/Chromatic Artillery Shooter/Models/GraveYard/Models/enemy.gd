extends CharacterBody3D


var player = null
@export var player_path : NodePath


func _physics_process(delta: float) -> void:

	move_and_slide()
