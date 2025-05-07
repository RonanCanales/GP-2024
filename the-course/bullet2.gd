extends Node3D

const SPEED = 10000
@onready var mesh = $Heart
@onready var ray = $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis * Vector3(0, 0, -SPEED) * delta
	ray.force_raycast_update()
	if ray.is_colliding():
		var hit = ray.get_collider()
		if hit and hit.has_method("take_damage"):
			hit.take_damage(1)
