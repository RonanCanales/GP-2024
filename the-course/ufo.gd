@tool
class_name Ufo

extends CharacterBody2D
@export var radius = 20

@export var color:Color = Color.WHITE
@export var explosion:PackedScene
@export var line_size:float = 3

@export var bullet_scene:PackedScene
@export var bullet_spawn:Node2D

var can_fire = false

func _ready() -> void:
	scale = Vector2.ZERO
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 1)
	randomise_timer()
	
func randomise_timer():
	$Timer.wait_time = randf_range(0, 10)
	$Timer.start()


func _draw() -> void:
	
	draw_arc(Vector2.ZERO, radius, PI, TAU, 6, color, line_size)
	draw_rect(Rect2(-radius * 2, 0, radius * 4, radius), color, false, line_size)
	# Draw small lights (circles) on the body
	for i in range(5):
		var light_rad = radius * 0.1
		var light_pos = Vector2(remap(i, 0, 4, (-radius * 2) + light_rad * 4, (radius * 2) - light_rad * 4), radius * 0.5)
		draw_circle(light_pos, radius * 0.1, color, false, line_size)

	pass
	 
func _process(delta):
	queue_redraw()
	pass


func _on_timer_timeout() -> void:
	var b = bullet_scene.instantiate()
	b.global_position = bullet_spawn.global_position
	b.global_rotation = PI
	get_tree().get_root().add_child(b) 
	b.color = color
	b.line_size = line_size
	b.set_collision_mask_value(3, false)
	randomise_timer()
	pass # Replace with function body.
