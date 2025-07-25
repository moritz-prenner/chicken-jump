extends TextureButton

@onready var PauseMenu = $"../Pause/PauseMenu"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PauseMenu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		PauseMenu.visible = true
		get_tree().paused = true


func _on_pressed() -> void:
	PauseMenu.visible = true
	get_tree().paused = true

func _on_resume_pressed() -> void:
	PauseMenu.visible = true
	get_tree().paused = false
	
