extends CharacterBody2D

class_name CivilianBase

@export var chicken_scene: PackedScene

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var start = $Start
@onready var civ_holder = $CivHolder
@onready var civ_spawn_timer = $CivSpawnTimer
@onready var end_1 = $End1
@onready var nav_agent = $NavAgent
@onready var animation_player = $AnimationPlayer


enum FACING_X { LEFT = -1, RIGHT = 1 }

var _speed: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	nav_agent.target_position = end_1.global_position

func move_civilian() -> void:
	var target = Vector2(start.position.x, start.position.y)
	

func spawn_civilian() -> void:
	var x_pos = start.position.x
	var y_pos = start.position.y
	var new_civ = chicken_scene.instantiate()
	
	new_civ.position = Vector2(x_pos, y_pos)
	civ_holder.add_child(new_civ)


func _on_end_reached(area):
	queue_free()


func _on_civ_spawn_timer_timeout():
	spawn_civilian()

func stop_civs() -> void:
	civ_spawn_timer.stop()
	for civ in civ_holder:
		civ.set_process(false)
	
func update_navigation() -> void:
	var npp = nav_agent.get_next_path_position()
	var ini_v = (npp - global_position).normalized() * _speed
	nav_agent.set_velocity(ini_v)
