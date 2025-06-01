extends Control

onready var angel_button = $angel
onready var gemma_button = $gemma
onready var tilupya_button = $tilupya

# Optional: Use these if you want to show selection effect
onready var sprite_nodes = {
	"angel": $"../angel",
	"gemma": $"../gemma",
	"tilupya": $"../tilupya"
}

# Map button nodes to skin indices
var skin_map = {
	"angel": 0,
	"gemma": 1,
	"tilupya": 2
}

func _ready():
	# Connect all buttons to a shared function
	angel_button.connect("pressed", self, "_on_skin_selected", ["angel"])
	gemma_button.connect("pressed", self, "_on_skin_selected", ["gemma"])
	tilupya_button.connect("pressed", self, "_on_skin_selected", ["tilupya"])

func _on_skin_selected(skin_name: String):
	var index = skin_map.get(skin_name, 0)
	Global.selected_skin_index = index
	Global.save_selected_skin()
	print("Selected skin:", skin_name, "Index:", index)
	
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().change_scene("res://src/MainMenu.tscn")
	
