extends Control

@onready var panel: Panel = $"../Panel"
@onready var panel_2: Panel = $Panel2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	panel_2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	visible = false


func _on_exit_pressed() -> void:
	visible = false
	get_tree().paused = false
	panel.visible = false
