extends Node2D

@onready var bullets = $Bullets

var tween: Tween
var bomb = preload("res://src/levels/enemy/bomb.tscn")
var counter: int = 0 
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_mouse_button"):
		tween = create_tween()
		tween.tween_property(self, "global_position", get_global_mouse_position(),1).set_trans(Tween.TRANS_BOUNCE)
		tween.finished.connect(Callable(self, "funkcja"))
		#global_position= get_global_mouse_position()


func funkcja():
	counter <= 1
	print(counter)


func _on_timer_timeout() -> void:
	var new_bomb = bomb.instantiate()
	bullets.add_child(new_bomb)
	 
	 
