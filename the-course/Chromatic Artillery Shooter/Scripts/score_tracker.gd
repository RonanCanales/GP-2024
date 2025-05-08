extends CanvasLayer

@onready var label = $ScoreTracker

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	label.text = "Love sent: " + str(ScoreManager.love_felt)
	pass
