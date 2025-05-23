extends Control
var Open1: PackedScene = preload("res://Open World/AppleWorld/Scenes/Open1.tscn")
var Open1inst = Open1.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_packed(Variablemanager.scene)

func _on_back_pressed():
	get_tree().change_scene_to_packed(Variablemanager.scene)


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main.tscn")
