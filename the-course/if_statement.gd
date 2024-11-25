extends Node2D
var i = 0


func _draw() -> void:
	i += 1
	print("dfgkpogkdfpogkdf" + str(i))
	var r = get_viewport_rect()
	r.size.x = r.size.x / 1

	var h = r.size.x / 2
	var p = get_viewport().get_mouse_position()
	var l = r.size.y / 2
	
	
	draw_rect(Rect2(0, 0, h, l,), Color.INDIAN_RED, true)
	draw_rect(Rect2(h, 0, h, l,), Color.ROSY_BROWN, true)
	draw_rect(Rect2(h, l, h, l,), Color.ORANGE, true)
	draw_rect(Rect2(0, l, h, l,), Color.RED, true)
	
	print(p)
	if p.x < h and p.y < l:
		draw_rect(Rect2(h, 0, h, l), Color.INDIAN_RED, true) # RIGHT SIDE
	
	elif p.x > h and p.y < l:
		draw_rect(Rect2(0, 0, h, l), Color.ROSY_BROWN, true)
	
	elif p.x < h and p.y > l:
		draw_rect(Rect2(0, l, h, l), Color.RED, true)  #LEFT SIDE
	
	elif p.x > h and p.y > l:
		draw_rect(Rect2(h, l, h, l), Color.ORANGE, true)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	pass
