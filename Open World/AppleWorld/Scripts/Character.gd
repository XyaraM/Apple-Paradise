extends CharacterBody2D
#Everything here is the movement
@onready var charactersprite=$Walk
@export var speed: int = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Variablemanager.savenode = $".."
		Variablemanager.scene.pack(Variablemanager.savenode)
		menu.emit()
	if Input.is_action_pressed("Accelerate"):
		speed = 300
	if Input.is_action_just_released("Accelerate"):
		speed = 100
	if Input.is_action_just_pressed("ui_right"):
		charactersprite.play("walkright")
		speed = 100
	if Input.is_action_just_pressed("ui_left"):
		charactersprite.play("walkleft")
		speed = 100
	if Input.is_action_just_pressed("ui_up"):
		charactersprite.play("walkup")
		speed = 100
	if Input.is_action_just_pressed("ui_down"):
		charactersprite.play("walkdown")
		speed = 100
	if (Input.is_anything_pressed()==false):
		charactersprite.play("stand")

func _physics_process(delta):
	if DialogueManager.is_dialog_active:
		return
	var directionx = Input.get_axis("ui_left", "ui_right")
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	if directionx:
		velocity.x = directionx * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
#Everything here is the movement


#This is connected to the "Open1.gd" file, everything here needs to be connected to the level lol
func _on_area_2d_area_entered(area):
	if area.is_in_group("ArcadeInteract"):
		arcadeinst.emit()
	if area.is_in_group("StoreInteract"):
		storeinst.emit()
# Legacy	if area.is_in_group("Dialogue1"):
# Legacy		dialogue.emit()
# Legacy	if area.is_in_group("Dialogue 2"):
# Legacy		dialogue.emit()
# Legacy signal dialogue

signal arcadeinst
signal storeinst
signal menu
#This is connected to the "Open1.gd" file, everything here needs to be connected to the level lol

# THIS VIDEO IS FOR MAKING COOLDOWNS OMG https://www.youtube.com/watch?v=QFICFcD5pUI IIIIMMMPOOOORTAAAANT
