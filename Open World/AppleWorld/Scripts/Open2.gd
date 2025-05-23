extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_teleport_area_entered(area):
	xd()

func xd():
	get_tree().change_scene_to_file("res://Open World/AppleWorld/Scenes/Open1.tscn")
