class_name Player extends Node2D


var bomb_scene: PackedScene = preload("res://src/bombs/Bomb.tscn")
@onready var bomb_timer: Timer = $BombTimer
@onready var bomb_marker: Marker2D = $BombMarker
var tween: Tween
var back = Vector2(100,100)
var counter: int = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("TeleportPlayer"):
		tween = create_tween()
		tween.tween_property(self, "global_position", get_global_mouse_position(), 0.5).set_trans(Tween.TRANS_CIRC	).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "global_position", back, 0.5)
		tween.finished.connect(funkcja)

func funkcja():
	counter += 1
	print(counter)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bomb_timer.timeout.connect(_on_bomb_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_bomb_timer_timeout():
	var instantiated_bomb: Node2D = bomb_scene.instantiate()
	bomb_marker.add_child(instantiated_bomb)
