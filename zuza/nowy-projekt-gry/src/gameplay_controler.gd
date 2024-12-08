class_name Gameplay extends Node

@onready var player: Player = %Player
@onready var ui = $"../UI/UI"

func _ready() -> void:
	ui.connect("dead",you_win)
	
	
func actualization_hp():
	print("hp")
	$"../UI/UI".set_hp(-20)
		
func you_win():
	print("wygrałeś!!!")
			
