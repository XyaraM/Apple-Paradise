extends Node2D

func _ready():
	Signalmanager.dialoguedelete.connect(deletedialogue)
func deletedialogue():
	queue_free()
