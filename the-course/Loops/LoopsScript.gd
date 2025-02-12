extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range (1, 11): #For
		print (i)

	var i = 10 #While
	while i > 0:
		print(i)
		i -= 1

	for x in range(3): # Nested Loops
		var row = ""
		for y in range(3):
			row += "(" + str(x) + ", " + str(y) + ") "
		print (row)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
