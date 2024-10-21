extends CharacterBody2D

@export var bullet_scene:PackedScene
@export var bullet_spawn_point:Node2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

const TURN_RATE = 180

func print_stuff():
	DebugDraw2D.set_text("pos", position)
	DebugDraw2D.set_text("global_position", global_position)
	DebugDraw2D.set_text("rotation", rotation)
	DebugDraw2D.set_text("rotation deg", rad_to_deg(rotation))
	DebugDraw2D.set_text("transform.x", transform.x)
	DebugDraw2D.set_text("global_transform.x", global_transform.x)
	DebugDraw2D.set_text("global_transform.y", global_transform.y)
	DebugDraw2D.set_text("vel", velocity)
func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("move_backwards", "move_forwards") * SPEED

func _physics_process(delta: float) -> void:
	print_stuff()
	get_input()
	
	
	if Input.is_action_pressed("fire"):
		var b = bullet_scene.instantiate()
		b.global_position = bullet_spawn_point.global_position
		b.global_rotation = bullet_spawn_point.global_rotation
		get_parent().add_child(b)
	
	move_and_slide()
