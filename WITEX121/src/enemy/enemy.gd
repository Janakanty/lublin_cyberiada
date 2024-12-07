extends Node2D

@onready var animacja = $AnimationPlayer

func enemy_sequence_start():
	animacja.play("new_animation")

func _ready() -> void:
	enemy_sequence_start()

func _on_animation_player_animation_finished(anim_name: StringName):
	if animacja.assigned_animation == "new_animation":
		animacja.play("new_animation_2")
	else:
		animacja.play("new_animation")
