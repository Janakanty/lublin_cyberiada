extends Node2D
class_name Player

@onready var bulltes = $Bullets

var tween: Tween
var bomb = preload("res://src/enemy/bomb/bomb.tscn")
var counter = 0

func _ready() -> void:
	pass
	#$Texture.play("default")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_mouse_button"):
		tween = create_tween()
		tween.tween_property(self, "global_position",get_global_mouse_position(),1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.finished.connect(funkcja)
		#global_position = get_global_mouse_position()

func funkcja():
	counter += 1
	#print(counter)

func get_dmg():
	pass
	
func _on_timer_timeout() -> void:
	var new_bomb = bomb.instantiate()
	bulltes.add_child(new_bomb)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print("kolizja z psem")
		get_parent().get_node("GameplayControler").actulizaton_hp()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		print("kolizja z psem")
		get_parent().get_node("GameplayControler").actulizaton_hp()
