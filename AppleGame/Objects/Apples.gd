extends StaticBody2D

func _physics_process(delta):
	move_and_collide(Vector2(0, 9))

func _on_area_2d_area_entered(area):
	queue_free()
