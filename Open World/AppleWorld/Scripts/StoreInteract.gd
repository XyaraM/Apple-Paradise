extends Node


func _on_area_2d_area_exited(area):
	Signalmanager.storeinteract.emit()
