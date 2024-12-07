extends Node2D

@onready var bullets = $bullets
var bomb = preload("res://src/enemy/bomb/bomb.tscn")

var tween: Tween
var back = Vector2(20,-150)
var counter: int = 0

func _ready():
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_mouse_button"):
		#global_position = get_global_mouse_position()
		tween = create_tween()
		tween.tween_property(self, "global_position", get_global_mouse_position(), 1).set_trans(Tween.TRANS_QUINT)
		tween.tween_property(self, "global_position", back, 1).set_trans(Tween.TRANS_QUINT)
		tween.finished.connect(funkcja)

func funkcja():
	counter +=1
	print(counter)
	print("back")


func _process(delta):
	pass


func _on_timer_timeout():
	var new_bomb = bomb.instantiate()
	bullets.add_child(new_bomb)
