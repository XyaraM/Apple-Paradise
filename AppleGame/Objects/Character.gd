class_name character
extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D
var iswaitactive = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var timo: bool = true

func _on_falseotrue_timeout():
	Variablemanager.AppleSpawn = true
	if iswaitactive == true:
		$"../falseotrue".wait_time -= Variablemanager.difficulty_wait_time
		print("XD")

func _process(delta):
	if Input.get_axis("ui_left", "ui_right"):
		_animated_sprite.play("active")
	else:
		_animated_sprite.stop()
	if Variablemanager.AppleSpawn == true:
		ApPosition.Apples = $"../Apples".get_children()
		ApPosition.Selected_Apples = ApPosition.Apples[randi() % ApPosition.Apples.size()]
		ApPosition.ApplesBad = $"../Apples2".get_children()
		ApPosition.Selected_ApplesBad = ApPosition.ApplesBad[randi() % ApPosition.ApplesBad.size()]
		ApShoot.emit(ApPosition.Selected_Apples.position)
		Variablemanager.AppleSpawn = false
	if Variablemanager.wastapple == 5:
		Variablemanager.AppleSpawn = false
		$"../falseotrue".wait_time = 1.314
	if Input.is_action_just_pressed("ui_right"):
		Variablemanager.SPEED = 900
	if Input.is_action_just_pressed("ui_left"):
		Variablemanager.SPEED = 900
	if Variablemanager.wastapple == 5:
		Variablemanager.AppleSpawn = false
		$"../falseotrue".start()
	if $"../falseotrue".wait_time <= 0.700:
		$"../falseotrue".wait_time = 0.700
		iswaitactive = false
	#Hard mode
	if Variablemanager.ApplCount >= 100:
		$"../falseotrue".wait_time = 0.650
	#Ultra hardmode
	if Variablemanager.ApplCount >= 150:
		$"../falseotrue".wait_time = 0.600
	if Input.is_action_pressed("ui_cancel"):
		Signalmanager.applecharaexit.emit()
	if Input.is_action_just_pressed("section") and timo:
		timo = false
		$Tim/Cooldown.start()
		if Variablemanager.wastapple == 0:
			pass
		else: 
			Variablemanager.wastapple -= 1
signal ApShoot(pos)

func _physics_process(delta):
	#Debug mode
	if Input.is_action_just_pressed("Debug Mode Activation"):
		var debug: PackedScene = preload("res://AppleGame/Scenes/debug.tscn")
		var debuginst = debug.instantiate()
		$"..".add_child(debuginst)
	if Input.is_action_just_pressed("ui_left"):
		rotation_degrees -= 30
	if Input.is_action_just_released("ui_left"):
		rotation = 0
	if Input.is_action_just_pressed("ui_right"):
		rotation_degrees += 30
	if Input.is_action_just_released("ui_right"):
		rotation = 0
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * Variablemanager.SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, Variablemanager.SPEED)
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Apple"):
		Variablemanager.ApplCount += 1
		Variablemanager.apples += 1
		print(Variablemanager.ApplCount)
		$collectedapple.play()
	if area.is_in_group("AppleBad"):
		Variablemanager.wastapple += 1
	if area.is_in_group("wall"):
		Variablemanager.SPEED = 0

func _on_cooldown_timeout():
	timo = true

# THIS VIDEO IS FOR MAKING COOLDOWNS OMG https://www.youtube.com/watch?v=QFICFcD5pUI IIIIMMMPOOOORTAAAANT
