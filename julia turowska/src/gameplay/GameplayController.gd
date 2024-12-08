class_name Gameplay
extends Node

@onready var player:Player = %Player
@onready var ui: UI = $"../UI/UI"


func _ready():
	ui.connect("dead", you_win)

func actualization_hp():
	$"../UI/UI".set_hp(-10)
	
func you_win():
	print("you win!!!")
