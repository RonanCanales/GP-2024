extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	#var line_count = 10
	#var screen_height = get_viewport().size.y
	#var screen_height = get_viewport().size.x
	#var spacing = screen_height / (line_count + 1)

	#for i  in range(line_count):
		#var y_position = (i + 1) * spacing
		#var x_position = (i + 1) * spacing
		#draw_line(Vector2(0, y_position), Vector2(get_viewport().size.x, y_position), Color.BEIGE)
		#draw_line(Vector2(x_position, 0), Vector2(x_position, get_viewport().size.y), Color.AQUA)
	
	var grid_size = 10 
	var screen_width = get_viewport().size.x
	var screen_height = get_viewport().size.y
	var horizontal_spacing = screen_height / (grid_size + 1)
	var vertical_spacing = screen_width / (grid_size + 1)

	for i in range(grid_size):
		var y_position = (i + 1) * horizontal_spacing
		draw_line(Vector2(0, y_position), Vector2(screen_width, y_position), Color.RED)

	for i in range(grid_size):
		var x_position = (i + 1) * vertical_spacing
		draw_line(Vector2(x_position, 0), Vector2(x_position, screen_height), Color.BLUE)
