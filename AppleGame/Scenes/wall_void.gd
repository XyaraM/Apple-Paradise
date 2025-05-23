extends Node2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("Apple"):
		Variablemanager.wastapple += 1
		print(Variablemanager.wastapple)
