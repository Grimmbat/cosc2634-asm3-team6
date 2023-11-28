extends CharacterBody2D

class_name CivBase

@export var chicken_scene: PackedScene

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var start_1 = $Start1
@onready var civ_holder = $CivHolder
@onready var civ_spawn_timer = $CivSpawnTimer
@onready var civ_spawn_location = $CivSpawnLocation


enum FACING_X { LEFT = -1, RIGHT = 1 }

var _speed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_civilian() -> void:
	var startpoint = start_1.global_position
	var civ = chicken_scene.instantiate()
	
	civ.position = Vector2(startpoint.x, startpoint.y)
	civ_holder.add_child(civ)
	
	var civ_spawn_location = Vector2(0, 0)
	civ_spawn_location.progress_ratio = randf()
	
	var direction = civ_spawn_location.rotation + PI/2
	
	civ.position = civ_spawn_location.position
	
	direction += randf_range(-PI/4, PI/4)
	civ.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	civ.linear_velocity = velocity.rotated(direction)

func _on_end_reached(area):
	queue_free()


func _on_civ_spawn_timer_timeout():
	spawn_civilian()
	
