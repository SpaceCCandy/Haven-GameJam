extends Node2D
@onready var label: Label = $Label

func _ready() -> void:
	label.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	label.visible = true
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	label.visible = false
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		pass
