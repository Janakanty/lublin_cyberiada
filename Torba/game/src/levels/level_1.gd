extends Node2D

@onready var animacja = $AnimationPlayer

func _ready() -> void:
	enemy_squence_start()

func enemy_squence_start():
	animacja.play("moving_dog_01")

func animation_01():
	animacja.play("moving_dog_01")
	
func animation_02():
	animacja.play("moving_dog_02")
