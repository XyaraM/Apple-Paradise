class_name dash_state
extends State

@export var actor: character
var dash: bool = true

func _process(delta):
	if $"../DashCooldown1".time_left >= 0.001:
		if Variablemanager.storebuyspeedup == 2:
			Variablemanager.SPEED = 1600
	if Input.is_action_just_pressed("Accelerate") and dash:
		$"../DashCooldown2".start()
		$"../DashCooldown1".start()
		dash = false

func _on_dash_cooldown_2_timeout():
	dash = true

func _on_dash_cooldown_1_timeout():
	print("done")
	Variablemanager.SPEED = 900
