extends Area2D

@onready var player = $"../../CharacterBody2D"
@onready var level = $"../../UI/LevelCleared"

var firstStar = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		level.starCounter = level.starCounter + 1
		queue_free()
		visible = false

func starReset():
	level.starCounter = 0;
