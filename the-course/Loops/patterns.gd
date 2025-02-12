extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	var circle_count = 10
	var screen_width = get_viewport().size.x
	var spacing = screen_width / (circle_count + 1)

	for i in range(circle_count):
		var radius = (i + 1) * 5
		var x_position = (i + 1) * spacing
		var center = Vector2(x_position, get_viewport().size.y / 2)
		draw_circle(center, radius, Color.RED)
