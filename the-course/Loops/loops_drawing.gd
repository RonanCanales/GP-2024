extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	var line_count = 10
	var screen_height = get_viewport().size.y
	var spacing = screen_height / (line_count + 1)

	for i  in range(line_count):
		var y_position = (i + 1) * spacing
		draw_line(Vector2(0, y_position), Vector2(get_viewport().size.x, y_position), Color.BEIGE)
