extends Node2D

var speed: int = 150
var direction: Vector2 = Vector2.DOWN
func _process(delta):
	position += direction * speed * delta


