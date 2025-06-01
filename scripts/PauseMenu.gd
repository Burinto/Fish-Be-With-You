# PauseMenu.gd
extends Control

onready var menu= $CanvasLayer
func _ready():
	visible = false # Start hidden
	# $AnimationPlayer.play("RESET") # You might not need RESET if it starts hidden
	# get_tree().paused = false # Game shouldn't start paused by the pause menu

func _unhandled_input(event): # Use _unhandled_input for global key presses like Esc
	if event.is_action_pressed("esc"):
		menu.visible=true
		# Do NOT open pause menu if level is complete
		if Global.is_level_complete:
			get_tree().set_input_as_handled() # Consume the event so other things don't process esc
			return

		if get_tree().paused and visible: # If game is paused AND pause menu is visible
			$AnimationPlayer.play_backwards("blur")
			resume_game()
		elif not get_tree().paused: # If game is not paused
			$AnimationPlayer.play("blur")
			pause_game()
		get_tree().set_input_as_handled()


func resume_game():
	get_tree().paused = false
	visible = false # Hide the pause menu

func pause_game():
	if Global.is_level_complete:
		return

	visible = true   # Show the pause menu
	$AnimationPlayer.play("blur")
	$AnimationPlayer.connect("animation_finished", self, "_on_blur_finished", [], CONNECT_ONESHOT)

func _on_blur_finished(anim_name: String):
	if anim_name == "blur":
		get_tree().paused = true

func toggle_pause():
	if Global.is_level_complete:
		return

	if get_tree().paused and visible:
		$AnimationPlayer.play_backwards("blur")
		resume_game()
	else:
		menu.visible = true
		$AnimationPlayer.play("blur")
		pause_game()


func _on_Resume_pressed():
	resume_game()
	menu.visible=false


func _on_Restart_pressed():
	# Make sure to reset global states if restarting
	#Global.reset_score() # This also sets is_level_complete to false
	Global.reset_score()
	Global.reset_player_stats()
	get_tree().paused = false # Unpause before reloading
	get_tree().reload_current_scene()


func _on_Quit_pressed():
	#Global.reset_score() # Good practice
	Global.reset_score()
	Global.reset_player_stats()
	get_tree().paused = false # Unpause before changing scene
	get_tree().change_scene("res://src/MainMenu.tscn")

# Remove testEsc() and the _process function if you move Esc handling to _unhandled_input
# func _process(_delta):
# 	testEsc()


func _on_Pause_Menu_button_pressed():
	toggle_pause()
