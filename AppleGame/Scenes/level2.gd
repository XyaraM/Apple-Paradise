extends Node2D
var AppleScene: PackedScene = preload("res://AppleGame/Objects/Apples.tscn")
var GameOverSc: PackedScene = preload("res://AppleGame/Scenes/gameover.tscn")
var hardmode: PackedScene = preload("res://AppleGame/Scenes/hardmode.tscn")
var level2: PackedScene = preload("res://AppleGame/Scenes/level2.tscn")
var AppleBadScene: PackedScene = preload("res://AppleGame/Objects/AppleBad.tscn")

func _on_node_2d_ap_shoot(pos):
	var AppleInst = AppleScene.instantiate()
	AppleInst.position = pos
	$AppleCount.add_child(AppleInst)

func _process(delta):
	if Variablemanager.wastapple == 5:
		if Variablemanager.highscore <= 0:
			Variablemanager.highscore = Variablemanager.ApplCount
		elif Variablemanager.highscore <= Variablemanager.ApplCount:
			Variablemanager.highscore = Variablemanager.ApplCount
		SaveSys.save()
		$falseotrue.stop()
		Variablemanager.AppleSpawn = false
		var GameOverScINST = GameOverSc.instantiate()
		$".".add_child(GameOverScINST)
		Variablemanager.stop = 0
	if Variablemanager.AppleSpawn == false:
		pass
	if Variablemanager.ApplCount == 100:
		#Hardmode logo
		var hardmodeinst = hardmode.instantiate()
		$".".add_child(hardmodeinst)
	if $falseotrue.timeout:
		if Variablemanager.stop == 1:
			var rng = RandomNumberGenerator.new()
			var my_random_number = rng.randf_range(-10.0, 10.0)
			print(my_random_number)
			if my_random_number >= 9.700:
				spawnbadsignal.emit(ApPosition.Selected_ApplesBad.position)
	if Input.is_action_just_pressed("b"):
		spawnbadsignal.emit(ApPosition.Selected_ApplesBad.position)

signal spawnbadsignal(pos)

func _on_spawnbadsignal(pos):
	var AppleBadInst = AppleBadScene.instantiate()
	AppleBadInst.position = pos
	$AppleCount.add_child(AppleBadInst)


func _on_fix_timeout():
	Variablemanager.AppleSpawn = true
	$Fix2.start()


func _on_fix_2_timeout():
	print("done")
	Variablemanager.AppleSpawn = false
	$Fix2.wait_time = 999999999999999
