extends Node

var save_path = "user://AppleParadise.save"

func save():
	checksavedataontrue()
	var file =  FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Variablemanager.highscore)
	file.store_var(Variablemanager.apples)
	file.store_var(Variablemanager.storebuyspeedup)
	file.store_var(Variablemanager.storewastappledel)
	file.store_var(Variablemanager.newsavedatachecker)
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Variablemanager.highscore = file.get_var(Variablemanager.highscore)
		Variablemanager.apples = file.get_var(Variablemanager.apples)
		Variablemanager.storebuyspeedup = file.get_var(Variablemanager.storebuyspeedup)
		Variablemanager.storewastappledel = file.get_var(Variablemanager.storewastappledel)
		Variablemanager.newsavedatachecker = file.get_var(Variablemanager.newsavedatachecker)
		
func checksavedataontrue():
	if Variablemanager.newsavedatachecker == false:
		Variablemanager.newsavedatachecker = true
	else:
		pass
