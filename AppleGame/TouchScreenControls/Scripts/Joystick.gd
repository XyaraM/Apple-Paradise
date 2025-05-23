extends Area2D

@onready var BigCircle = $BigCircle
@onready var SmallCircle = $BigCircle/SmallCircle
@onready var MaxDistance = $CollisionShape2D.shape.radius
