extends Control

func _process(delta):
	$Label.text = str(Variablemanager.apples)
