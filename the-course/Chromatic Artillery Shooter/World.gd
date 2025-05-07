extends Node3D

@onready var spawns = $Spawns
@onready var navigation_region = $NavigationRegion3D
@onready var music = $AudioStreamPlayer3D

var enemy = load("res://Chromatic Artillery Shooter/Models/GraveYard/Models/enemy.tscn")
var instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music.play()
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _get_random_child(parent_node):
	var random_id = randi() % parent_node.get_child_count()
	return parent_node.get_child(random_id)


func _on_enemy_spawn_timer_timeout() -> void:
	var spawn_point = _get_random_child(spawns).global_position
	instance = enemy.instantiate()
	instance.position = spawn_point
	instance.player_path = "/root/World/Player"
	var random_scaling = randf_range(0.5, 1.5)
	instance.scale = Vector3.ONE * random_scaling
	navigation_region.add_child(instance)
