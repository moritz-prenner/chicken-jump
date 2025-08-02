extends Control

@onready var panel2: Panel = $Panel2
@onready var panel: Panel = $Panel

@onready var tutorial_scene: String = "res://tutorial.tscn"
@onready var main_game: String = "res://main-game.tscn"
@onready var options: Panel = $Options
@onready var credits: Control = $Credits

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	panel2.visible = true
	panel.visible = false
	

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file(tutorial_scene)


func _on_main_pressed() -> void:
	get_tree().change_scene_to_file(main_game)


func _on_options_pressed() -> void:
	options.visible = true
	panel.visible = false


func _on_credits_pressed() -> void:
	panel.visible = false
	credits.visible = true
