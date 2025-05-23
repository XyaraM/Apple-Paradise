extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("x"):
		Variablemanager.ApplCount = 100
	if Input.is_action_just_pressed("c"):
		Variablemanager.ApplCount = 150
	if Input.is_action_just_pressed(("z")):
		Variablemanager.AppleSpawn = true
		print(Variablemanager.AppleSpawn)
	if Input.is_action_just_pressed(("v")):
		print(Variablemanager.highscore)
	if Input.is_action_just_pressed("Deny"):
		Variablemanager.apples = 0
	if Input.is_action_just_pressed("m"):
		Variablemanager.apples += 10
