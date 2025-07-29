extends Panel

@onready var slider: HSlider = $HSlider2
@onready var slider1: HSlider = $HSlider
@onready var panel: Panel = $"../Panel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	slider.process_mode = Node.PROCESS_MODE_ALWAYS
	slider1.process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func openOptions():
	visible = true
	

func _on_save_pressed() -> void:
	visible = false
	panel.visible = true


func _on_h_slider_2_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))
