extends CanvasLayer  # oder CanvasLayer, oder dein UI-Root

@onready var click_sound: AudioStreamPlayer = $"../Buttonclick"

func _ready():
	connect_all_buttons(self)

func connect_all_buttons(node):
	for child in node.get_children():
		if child is Button:
			child.pressed.connect(_on_button_pressed)
		elif child.has_method("get_children"):
			connect_all_buttons(child)

func _on_button_pressed():
	if click_sound.playing:
		click_sound.stop()  # optional, für schnelles Neuabspielen
	click_sound.play()
