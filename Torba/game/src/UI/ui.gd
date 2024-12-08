extends Control
class_name UI

signal dead

var life: bool = true
var hp = 30

func _ready() -> void:
	print(hp)

func set_hp(value) -> void:
	hp = value + $HP.value
	$HP.value = hp

func if_life() -> bool:
	if hp <= 0:
		life = false
		emit_signal("dead")
	return life

func _on_button_pressed() -> void:
	set_hp(int($TextEdit.text))
	print(int($TextEdit.text))
	
	
func _on_hp_value_changed(value: float) -> void:
	if_life()
