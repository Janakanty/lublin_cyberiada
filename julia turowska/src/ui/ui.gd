class_name UI
extends Control

signal dead

var life: bool = true
var hp = 100
var tween: Tween


# Dodawanie HP
func set_hp(value:int) -> void:
	hp = value + $HP.value
	tween = create_tween()
	tween.tween_property($HP, "value", hp, 0.2).set_trans(Tween.TRANS_SINE)
	

func if_life() -> bool:
	if hp <= 0:
		life = false
		emit_signal("dead")
	return life


func _on_button_pressed():
	set_hp(int($TextEdit.text))


func _on_hp_value_changed(value):
	if_life()
