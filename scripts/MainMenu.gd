extends Node2D

var nextScene = Global.load_player_progress()
onready var how2play= $tutorial
onready var exit=$exit

func _ready():
	pass # Replace with function body.

func _on_NewGame_pressed():
	get_tree().change_scene("res://src/levels/Level1.tscn")
	print("New Game pressed: going to tutorial") #new game dapat pupunta ng tutorial?

func _on_LoadGame_pressed():
	get_tree().change_scene(nextScene)

func _on_ChangeAppearance_pressed():
	get_tree().change_scene("res://src/scenes/ChangeAppearance.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://src/scenes/Settings.tscn")


func _on_PearlButton1_pressed():
	get_tree().change_scene("res://src/levels/Level1.tscn")
	print("New Game pressed: going to level 1")


func _on_PearlButton2_pressed():
	get_tree().change_scene(nextScene)


func _on_PearlButton3_pressed():
	get_tree().change_scene("res://src/scenes/ChangeAppearance.tscn")


func _on_tutorial_pressed():
	how2play.visible= true


func _on_exit_pressed():
	exit.visible= true


func _on_yes_pressed():
	get_tree().change_scene("res://src/components/how2play.tscn")


func _on_no_pressed():
	how2play.visible = false
	get_tree().change_scene("res://src/MainMenu.tscn")


func _on_ExitYes_pressed():
	get_tree().quit()
	
func _on_ExitNo_pressed():
	exit.visible = false
	get_tree().change_scene("res://src/MainMenu.tscn")
