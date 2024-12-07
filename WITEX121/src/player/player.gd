class_name Player extends Node2D


var bomb_scene: PackedScene = preload("res://src/bombs/Bomb.tscn")
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
	self.global_position = new_player_position


func _on_bomb_timer_timeout():
	var instantiated_bomb: Node2D = bomb_scene.instantiate()
	bomb_marker.add_child(instantiated_bomb)
