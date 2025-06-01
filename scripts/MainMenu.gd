#MainMenu.gd
extends Node2D

var nextScene = Global.load_player_progress()

func _ready():
	pass # Replace with function body.

func _on_NewGame_pressed():
	var loading_scene = preload("res://src/scenes/LoadingScreen.tscn").instance()
	loading_scene.target_scene_path = "res://src/levels/Level1.tscn"
	get_tree().root.add_child(loading_scene)
	
func _on_LoadGame_pressed():
	var loading_scene = preload("res://src/scenes/LoadingScreen.tscn").instance()
	loading_scene.target_scene_path = nextScene
	get_tree().root.add_child(loading_scene)

func _on_ChangeAppearance_pressed():
	get_tree().change_scene("res://src/scenes/ChangeAppearance.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://src/scenes/Settings.tscn")


