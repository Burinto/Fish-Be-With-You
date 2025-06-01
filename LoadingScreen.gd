#LoadingScreen.gd
extends Control

export (String) var target_scene_path = ""  # Set in the editor or script

var loading_images = [
	"res://assets/loading_screens/LS1.png",
	"res://assets/loading_screens/LS2.png",
	"res://assets/loading_screens/LS3.png",
	"res://assets/loading_screens/LS4.png",
	"res://assets/loading_screens/LS5.png",
	"res://assets/loading_screens/LS6.png",
	"res://assets/loading_screens/LS7.png",
	"res://assets/loading_screens/LS8.png",
	"res://assets/loading_screens/LS9.png",
	"res://assets/loading_screens/LS10.png",
	"res://assets/loading_screens/LS11.png",
	"res://assets/loading_screens/LS12.png",
	"res://assets/loading_screens/LS13.png",
	"res://assets/loading_screens/LS14.png",
	"res://assets/loading_screens/LS15.png",
	"res://assets/loading_screens/LS16.png",
	"res://assets/loading_screens/LS17.png",
	"res://assets/loading_screens/LS18.png",
	"res://assets/loading_screens/LS19.png"
]

func _ready():
	var texture_rect = $LoadingImage
	var index = Global.get_next_loading_index(loading_images.size())
	var tex = load(loading_images[index])
	texture_rect.texture = tex

	# Simulate loading delay
	yield(get_tree().create_timer(1.5), "timeout")

	# Now change the scene
	var err = get_tree().change_scene(target_scene_path)
	if err == OK:
		# Queue the loading screen for deletion
		queue_free()
	else:
		print("ERROR loading target scene:", target_scene_path)
