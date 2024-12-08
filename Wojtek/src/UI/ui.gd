extends Control


var alive: bool = true
var hp_tween: Tween
@export var hp: int
@onready var button: Button = $Button
@onready var text_edit: TextEdit = $TextEdit
@onready var hp_progress_bar: TextureProgressBar = $HpTextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_hp(lost_hp: int) -> void:
	hp = $HpTextureProgressBar.value - lost_hp
	start_hp_change_animation()


func is_alive() -> bool:
	return alive

func _button_pressed():
	set_hp(int(text_edit.text))

func start_hp_change_animation():
	hp_tween = create_tween()
	hp_tween.tween_property(hp_progress_bar, "value", hp, 1).set_trans(Tween.TransitionType.TRANS_QUAD)