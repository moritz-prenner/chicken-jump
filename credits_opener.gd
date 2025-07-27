extends Node

@onready var credits: Control = $"../UI/Credits"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	credits.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_credits_pressed() -> void:
	print("openend")
	credits.visible = true
