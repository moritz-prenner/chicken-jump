extends Node



@onready var anim = $Player/AnimatedSprite2D

func _ready() -> void:
	anim.play("idle-right")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



		
