extends Control
@onready var setting: Panel = $Setting
@onready var credits: Panel = $Credits

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/bedroom.tscn")

func _on_settings_btn_pressed() -> void:
	setting.visible = true

func _on_credits_btn_pressed() -> void:
	credits.visible = true

# Settings
func _on_exit_btn_pressed() -> void:
	setting.visible = false
	credits.visible = false
