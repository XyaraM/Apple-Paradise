extends Control
var pack: PackedScene = preload("res://Open World/AppleWorld/Scenes/Open1.tscn")
var pack2: PackedScene = preload("res://Open World/AppleWorld/Scenes/Open2.tscn")
func _on_play_pressed():
	$play.start()
	$collectedapple.play()
func _on_play_timeout():
	if Variablemanager.newsavedatachecker == false:
		get_tree().change_scene_to_packed(pack2)
	else:	
		get_tree().change_scene_to_packed(pack)

func _on_exit_pressed():
	get_tree().quit()

func _process(delta):
	$Label2.text = str(Variablemanager.highscore)
	if Input.is_action_just_pressed("EasterEgg"):
		$collectedapple.play()
func _ready():
	SaveSys.load_data()
