extends Node2D

var civilian_scene: PackedScene = preload("res://npc/civilian/chicken_civ.tscn")

@onready var timer = $Timer
@onready var paths = $Paths.get_children()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_civilian() -> void:
	var p = paths.pick_random()
	var c = civilian_scene.instantiate
	p.add_child(c)


func _on_timer_timeout():
	spawn_civilian()
