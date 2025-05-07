extends CharacterBody3D

const SPEED = 4.0
@export var player_path: NodePath  
@onready var nav_agent = $NavigationAgent3D 
@onready var mesh = $Body
var player = null 
var original_material = null
var health: int = 5



func _ready():
	original_material = mesh.material_override
	if has_node(player_path):
		player = get_node(player_path)
	else:
		print("Player not found at path: ", player_path)  

func _physics_process(delta):
	if player == null:
		return  

	velocity = Vector3.ZERO  
	nav_agent.set_target_position(player.global_transform.origin)  
	var next_nav_point = nav_agent.get_next_path_position() 
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED 
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP) 
	move_and_slide() 


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.take_damage()  

func take_damage(amount: int = 1):
	health -= amount
	if health <= 0:
		queue_free()
	_damage_flash()

func _damage_flash() -> void:
	
	var red_material = StandardMaterial3D.new()
	red_material.albedo_color = Color(1.0, 0.0, 0.0) 

	
	mesh.material_override = red_material

	
	get_tree().create_timer(0.1).timeout.connect(_revert_material)

func _revert_material() -> void:
	mesh.material_override = original_material
