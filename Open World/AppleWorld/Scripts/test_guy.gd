extends Node2D
@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D
@onready var speech_sound = preload("res://Open World/AppleWorld/Sounds/264762__farpro__guiclick.ogg")

const lines: Array[String] = [
	"This is a test dialogue",
	"omg",
	"this kinda works fine"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if interaction_area.get_overlapping_bodies().size() > 0:
			DialogueManager.start_dialog(global_position, lines, speech_sound)
# next part of the tutorial: https://youtu.be/ajCraxGAeYU?t=524
