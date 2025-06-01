extends Control

#NOTE! always naka on yung pong scene 1, text1, hearts, stars, time at progress bar w/o highlight
#then off na the rest. ACADJIADHIADJH nalilito na q sa node structure
#node references

#onready var bar = 
#onready var bar_1= 
#onready var bar_2=
#onready var time = 
#onready var stars = 
#onready var stars_highlight=
onready var next_button= $fg/next
onready var heart
onready var heart_highlight= $hearts/heartshighlight
onready var scene1= $scene1
onready var scene2= $scene2
onready var scene3= $scene3
onready var scene4=$scene4
onready var scene5=$scene5
onready var scene6=$scene6
onready var scene7=$scene7
onready var scene8=$scene8
onready var scene9=$scene9
onready var scene10=$scene10
onready var scene11=$scene11
onready var scene12=$scene12
onready var scene13=$scene13
onready var scene14=$scene14
onready var scene15=$scene15
onready var scene16=$scene16
onready var fade_rect = $animation/fade
onready var tween = $animation/Tween
var screen_width = 1280

# Scene references
onready var scenes = [
	$scene1, $scene2, $scene3, $scene4, $scene5,
	$scene6, $scene7, $scene8, $scene9, $scene10,
	$scene11, $scene12, $scene13, $scene14, $scene15, $scene16
]

# Button positions for each step
var button_positions = [
	Vector2(), # unused at step 0
	Vector2(549, 303),
	Vector2(851, 285),
	Vector2(851, 285),
	Vector2(851, 285),
	Vector2(907, 249),
	Vector2(587, 329),
	Vector2(587, 329),
	Vector2(587, 329),
	Vector2(1031, 223),
	Vector2(1031, 223),
	Vector2(1055, 354),
	Vector2(1055, 354),
	Vector2(1055, 354),
	Vector2(1055, 354),
	Vector2(1055, 354)
]


# Track how many times the "Next" button has been pressed
var step = 0

func _ready():
	# Only show the first scene initially
	for i in range(1, scenes.size()):
		scenes[i].visible = false
	fade_rect.modulate.a = 0



func _on_next_pressed():
	if step >= scenes.size() - 1:
		return  # No more scenes

	step += 1
	# Start fade out
	tween.interpolate_property(fade_rect, "modulate:a", 0, 1, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_all_completed")

	# Change scene visibility
	for i in range(scenes.size()):
		scenes[i].visible = (i == step)

	# Move the button
	next_button.rect_position = button_positions[step]

	# Fade back in
	tween.interpolate_property(fade_rect, "modulate:a", 1, 0, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_all_completed")


func _on_yes_pressed():
	get_tree().change_scene("res://src/levels/Level1.tscn")


func _on_no_pressed():
	get_tree().change_scene("res://src/MainMenu.tscn")
