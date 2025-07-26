extends TextureButton

@onready var PauseMenu = $"../Pause/PauseMenu"
@onready var dialog = $"../../DialogueUI/TextureRect"
@onready var resume = $"../Pause/PauseMenu/VBoxContainer/Resume"

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	PauseMenu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		PauseMenu.visible = true
		dialog.visible = false
		get_tree().paused = true


func _on_pressed() -> void:
	PauseMenu.visible = true
	dialog.visible = false
	get_tree().paused = true

func _on_resume_pressed() -> void:
	PauseMenu.visible = false
	get_tree().paused = false
	
