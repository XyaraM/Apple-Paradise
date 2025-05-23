extends Area2D

class_name InteractionArea
@export var action_name: String = "interact"

var interact: Callable = func():
	pass

func _on_body_entered(body):
	InteractionManager.register_area(self)

func _on_body_exited(body):
	if Variablemanager.dialogueexited == true:
		Signalmanager.dialoguedelete.emit()
	InteractionManager.unregister_area(self)
