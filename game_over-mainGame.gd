extends Panel

@onready var options = $"../../Options"
@onready var checkpoint: Node2D = $"../../../Checkpoints/Checkpoint"
@onready var player: CharacterBody2D = $"../../../CharacterBody2D"
@onready var enemy: Path2D = $"../../../Path2D"
@onready var checkpoint2: Node2D = $"../../../Checkpoints/Checkpoint2"
@onready var camera_2d: Camera2D = $"../../../CharacterBody2D/Camera2D"

var currentCheckpoint = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_options_pressed() -> void:
	options.openOptions()


func _on_credits_pressed() -> void:
	visible = false


func _on_retry_pressed() -> void:
	enemy.reactivate()
	visible = false
	match currentCheckpoint:
		0:
			get_tree().paused = false
			player.position = checkpoint.position
			camera_2d.position = checkpoint.position
			
		1:
			get_tree().paused = false
			player.position = checkpoint2.position
			camera_2d.position = checkpoint2.position
			
