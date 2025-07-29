extends Panel

@onready var star = $"../../Stars/star"
@onready var textureRect = $TextureRect

var starCounter = 0

@onready var star0 = preload("res://assets/star0.png")
@onready var star1 = preload("res://assets/star1.png")
@onready var star2 = preload("res://assets/star2.png")
@onready var star3 = preload("res://assets/star3.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

@onready var target_scene: String = "res://main-game.tscn"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func levelCleared():
	visible = true
	get_tree().paused = true
	match starCounter:
		0:
			textureRect.texture = star0
		1:
			textureRect.texture = star1
		2:
			textureRect.texture = star2
		3:
			textureRect.texture = star3


func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false
