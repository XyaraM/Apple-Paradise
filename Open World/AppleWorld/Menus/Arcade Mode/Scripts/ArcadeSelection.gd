extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Accept"):
		$Sounds/Click.play()
		get_tree().change_scene_to_file("res://AppleGame/Scenes/Level.tscn")
	if Input.is_action_just_pressed("Deny"):
		$Sounds/Click.play()
		queue_free()

func _ready():
	Signalmanager.deletearcadeinst.connect(delete)
func delete():
	queue_free()
