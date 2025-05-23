extends Node2D
func _process(delta):
	if Variablemanager.ApplCount == 100:
		$Label.text = "Hard Mode"
		var red = Color(1.0,0.0,0.0,1.0)
		set("$Label/theme_override_colors/font_color",red)
	elif Variablemanager.ApplCount == 150:
		$Label.text = "Ultra Hard Mode"
