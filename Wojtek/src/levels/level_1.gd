extends Node2D



@onready var animation_player: AnimationPlayer = $AnimationPlayer


func enemy_sequence_start():
	pass



func enemy_sequence_stop():
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play()
	animation_player.animation_finished.connect(_on_animation_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animation_finished(name: String):
	print("FINISHED")
	if animation_player.current_animation == "moving":
		animation_player.play("moving2")
	else:
		animation_player.play("moving")