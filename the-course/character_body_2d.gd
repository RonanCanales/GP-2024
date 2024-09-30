extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const TURN_RATE = 180

func _physics_process(delta: float) -> void:
	
	var r = Input.get_axis("Turn Left", "Turn Right")
	print(r)
	
	var rot = deg_to_rad(r * TURN_RATE * delta)
	
	var f = Input.get_axis("Forward", "Back")
	
	var vel = transform.y + f + SPEED
	velocity = vel
	
	
	rotate(rot)
	move_and_slide()
