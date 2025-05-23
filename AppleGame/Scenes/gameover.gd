extends Control
var open1: PackedScene = preload("res://Open World/AppleWorld/Scenes/Open1.tscn")
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Variablemanager.wastapple = 0
		Variablemanager.ApplCount = 0
		if Variablemanager.ApplCount >= 100:
			self.queue_free()
			get_tree().change_scene_to_file("res://Scenes/level2.tscn")
		elif Variablemanager.ApplCount <= 100:
			self.queue_free()
			get_tree().change_scene_to_file("res://AppleGame/Scenes/Level.tscn")
	elif Input.is_action_just_pressed("ui_cancel"):
		Variablemanager.wastapple = 0
		Variablemanager.ApplCount = 0
		self.queue_free()
		get_tree().change_scene_to_packed(open1)
