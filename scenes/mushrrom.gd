extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var tile_map_layer_2: TileMapLayer = $"../TileMapLayer2"

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.velocity.y = -1000
	tile_map_layer_2.collision_enabled = true
	animated_sprite_2d.play("bounce")
