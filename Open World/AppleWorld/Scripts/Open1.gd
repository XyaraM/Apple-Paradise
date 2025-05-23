extends Node
var arcadeselect: PackedScene = preload("res://Open World/AppleWorld/Menus/Arcade Mode/Scenes/Arcade Selection.tscn")
var storeinst: PackedScene = preload("res://Open World/AppleWorld/Menus/Store/Scenes/Store.tscn")
var menu: PackedScene = preload("res://Open World/AppleWorld/Menus/Main Menu Open/Scenes/Menu.tscn")

#This is the code to instantiate the "/AppleWorld/Scenes/MENUS" scenes
func arcadeselinst():
	var arcadeselectinst = arcadeselect.instantiate()
	$".".add_child(arcadeselectinst)
	
func storeselinst():
	var storeselectinst = storeinst.instantiate()
	$".".add_child(storeselectinst)
#This is the code to instantiate the "/AppleWorld/Scenes/MENUS" scenes

#This is the signals in the character to make the other functions work
func _on_character_arcadeinst():
	arcadeselinst()

func _on_character_storeinst():
	storeselinst()

#This is the signals in the character to make the other functions work

func _on_character_menu():
	get_tree().change_scene_to_packed(menu)
