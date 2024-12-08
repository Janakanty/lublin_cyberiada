extends Node2D


@onready var animacja = $AnimationPlayer

func enemy_sequence_start():
	animacja.play("movee")

func enemy_back():
	animacja.play("move_back")
	
