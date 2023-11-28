extends CharacterBody2D

class_name CivilianBase

@export var chicken_scene: PackedScene

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var start_1 = $Start1
@onready var civ_spawn_timer = $CivSpawnTimer
@onready var end_1 = $End1
@onready var civ_holder = $CivHolder

var startpoint = start_1
var endpoint = end_1

enum FACING_X { LEFT = -1, RIGHT = 1 }

var _speed: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_civilian() -> void:
	var x_pos = startpoint.position.x
	var y_pos = endpoint.position.y
	var new_civ = chicken_scene.instantiate()
	
	new_civ.position = Vector2(x_pos, y_pos)
	civ_holder.add_child(new_civ)
	


func _on_end_reached(area):
	queue_free()


func _on_civ_spawn_timer_timeout():
	spawn_civilian()

func stop_civs() -> void:
	civ_spawn_timer.stop()
	
	
