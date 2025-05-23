extends Node

var aboutspeedup: PackedScene = preload("res://Open World/AppleWorld/Menus/Store/Scenes/About.tscn")
var aboutremovewast: PackedScene = preload("res://Open World/AppleWorld/Menus/Store/Scenes/About1.tscn")

func _ready():
	Signalmanager.storeinteract.connect(delete) #This is for the deletion of the node when exited
	Signalmanager.storeDASHSPEEDUP.connect(SPEEDUPFUNCTION)
	Signalmanager.storeWASTEDAPPLESDEL.connect(WASTEDAPPLESDEL)

func delete():
	queue_free()

#This is for the store functions
func _on_button_pressed():
	Signalmanager.storeDASHSPEEDUP.emit()
	$Sounds/Click.play()
func _on_button_2_pressed():
	Signalmanager.storeWASTEDAPPLESDEL.emit()
	$Sounds/Click.play()
func SPEEDUPFUNCTION():
	storeSPEEDUP()

func WASTEDAPPLESDEL():
	storeWASTAPPLE()

func _process(delta):
	if Variablemanager.storebuyspeedup == 2:
		$Text/Label3.text = "Already Acquired"
	if Variablemanager.storewastappledel == 2:
		$Text/Label5.text = "Already Acquired"

func _on_already_acquired_timeout():
	$Text/Label4.text = ""

func storeSPEEDUP():
	if Variablemanager.apples >= 120:
		if Variablemanager.storebuyspeedup == 2:
			print("Already Acquired")
		else:
			Variablemanager.apples -= 120
			print("DEAL!")
			Variablemanager.storebuyspeedup = 2
			SaveSys.save()
	else:
		$Text/Label4.text = "You dont have enough apples"
		$"Already acquired".start()
		print("You dont have enough money")

func storeWASTAPPLE():
	if Variablemanager.apples >= 200:
		if Variablemanager.storewastappledel == 2:
			print("Already Acquired")
		else:
			Variablemanager.apples -= 200
			print("DEAL!")
			Variablemanager.storewastappledel = 2
			SaveSys.save()
	else:
		$Text/Label4.text = "You dont have enough apples"
		$"Already acquired".start()
		print("You dont have enough money")


func _on_about_pressed():
	Variablemanager.savenode = $".."
	Variablemanager.scene.pack(Variablemanager.savenode)
	get_tree().change_scene_to_packed(aboutspeedup)


func _on_about_2_pressed():
	Variablemanager.savenode = $".."
	Variablemanager.scene.pack(Variablemanager.savenode)
	get_tree().change_scene_to_packed(aboutremovewast)
