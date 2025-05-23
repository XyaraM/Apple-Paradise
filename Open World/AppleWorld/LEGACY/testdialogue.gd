extends Node2D
var textbox: PackedScene = preload("res://Open World/AppleWorld/Objects/Dialogues/textbox.tscn")
var text
@onready var parent
@export var textsec = ""

func _on_area_2d_area_exited(area):
	parent = null
	Signalmanager.dialoguedelete.emit()
	text = ""

func _on_character_dialogue(): 
	var textboxinst = textbox.instantiate()
	adddialoguelater(textboxinst)
func adddialoguelater(textboxinst: Node):
	parent = get_node(".")
	parent.call_deferred("add_child", textboxinst)

func _on_area_2d_area_entered(area):
	text = str(textsec)
	print(text)
	Textwork.execdialogue(text)
