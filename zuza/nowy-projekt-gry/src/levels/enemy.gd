extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("bullets"):
		pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
