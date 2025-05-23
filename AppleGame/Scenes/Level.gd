extends Node2D
var AppleScene: PackedScene = preload("res://AppleGame/Objects/Apples.tscn")
var GameOverSc: PackedScene = preload("res://AppleGame/Scenes/gameover.tscn")
var hardmode: PackedScene = preload("res://AppleGame/Scenes/hardmode.tscn")
var level2: PackedScene = preload("res://AppleGame/Scenes/level2.tscn")

func _ready():
	Signalmanager.applecharaexit.connect(exitapple)

func _on_node_2d_ap_shoot(pos):
	var AppleInst = AppleScene.instantiate()
	AppleInst.position = pos
	$AppleCount.add_child(AppleInst)
	
func _process(delta):
	if Variablemanager.wastapple == 5:
		var GameOverScINST = GameOverSc.instantiate()
		$".".add_child(GameOverScINST)
		if Variablemanager.highscore <= 0:
			Variablemanager.highscore = Variablemanager.ApplCount
		elif Variablemanager.highscore <= Variablemanager.ApplCount:
			Variablemanager.highscore = Variablemanager.ApplCount
		SaveSys.save()
		$falseotrue.stop()
		Variablemanager.AppleSpawn = false
	if Variablemanager.ApplCount == 100:
		#Hardmode logo
		var hardmodeinst = hardmode.instantiate()
		$".".add_child(hardmodeinst)
		#Change the scene
		get_tree().change_scene_to_packed(level2)
	
func exitapple():
	Variablemanager.ApplCount = 0
	Variablemanager.wastapple = 0
	get_tree().change_scene_to_file("res://Open World/AppleWorld/Scenes/Open1.tscn")
