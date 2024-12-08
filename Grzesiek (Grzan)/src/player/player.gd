class_name Player extends Node2D


var bomb_scene: PackedScene = preload("res://src/bombs/Bomb.tscn")
var animation_tween: Tween
var base_position: Vector2 = Vector2.ONE * 100
var counter: int = 0
@onready var bomb_timer: Timer = $BombTimer
@onready var bomb_marker: Marker2D = $BombMarker


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("TeleportPlayer"):
		
		teleport_player()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bomb_timer.timeout.connect(_on_bomb_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func teleport_player():
	var new_player_position: Vector2 = get_global_mouse_position()
	animation_tween = create_tween()
	animation_tween.tween_property(self, "global_position", get_global_mouse_position(), 1).set_trans(Tween.TransitionType.TRANS_SPRING)
	animation_tween.tween_property(self, "global_position", base_position, 1)  
	animation_tween.finished.connect(_on_tween_finished)

func _on_bomb_timer_timeout():
	var instantiated_bomb: Node2D = bomb_scene.instantiate()
	bomb_marker.add_child(instantiated_bomb)

func _on_tween_finished():
	counter += 1
	print(counter)