class_name walkstate
extends State

func _process(delta):
	if Input.is_action_just_pressed("Accelerate"):
		$DashTimer.start()
	Variablemanager.SPEED = 900
