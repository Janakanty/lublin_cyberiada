extends Control
class_name UI 

signal dead 


var life: bool = true
var hp = 100
var tween: Tween

# Dodać sobie hp

func _ready() -> void:
	print(hp)

func set_hp(value) -> void:
	hp = value + $HP.value
	tween = create_tween()
	tween.tween_property($HP,"value", hp, 0.2)
		
	
# Zniżyć hp
func if_life() -> bool:
	if hp <= 0:
		emit_signal("dead")
	return life 



# return sprawdza czy life
		

	
func _on_button_pressed() -> void:
	set_hp(int($TextEdit.text))
	print(int($TextEdit.text))
	
	
func _on_hp_value_changed(value: float) -> void:
		if_life()
		
