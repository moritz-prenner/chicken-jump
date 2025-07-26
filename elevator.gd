extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var player = $"../../CharacterBody2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body != $"../../TileMapLayer":
		body.elevate()
	


func _on_body_exited(body: Node2D) -> void:
	if body != $"../../TileMapLayer":
		body.elevateEnd()
