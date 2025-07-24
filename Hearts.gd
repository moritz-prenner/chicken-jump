extends AnimatedSprite2D

@onready var display = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display.play("3Hearts")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
