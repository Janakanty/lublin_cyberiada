extends Node2D


@onready var animacja = $AnimationPlayer

func enemy_sequence_start():
	animacja.play("new_animation")
	

func animation_01():
	animacja.play("new_animation")

func animation_02():
	animacja.play("new_animation_2")
	
