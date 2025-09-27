extends Node2D



var is_outline: bool
var is_pick_up: bool
var _is_visible: bool
@export var is_on_tree: bool

var apple = self
var target_node = null

@onready var entered = $Enter

@export var item: InvItem
var player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fallfromtree()
	is_outline = false
	is_pick_up = false
	_is_visible = true
	is_on_tree = false

func fallfromtree():
	$AnimationPlayer.play("fallingfromtree")
	await get_tree().create_timer(1.5).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	recalc_path()
	if is_visible:
		handle_animation()
	pick_up()


func pick_up():
	var _animated = $AnimatedSprite2D
	if is_pick_up && Input.is_action_just_pressed("ui_grab") && !$AnimationPlayer.current_animation == "fallingfromtree":
		is_outline = false
		_is_visible = false
		$AnimationPlayer.play("fade")
		player.collect(item)
		entered.monitoring = false


func handle_animation():
	var animated = $AnimatedSprite2D
	if is_outline && !$AnimationPlayer.current_animation == "fallingfromtree":
		animated.play("defaultol")
	else:
		animated.play("default")


func recalc_path():
	if target_node:
		is_outline = true
		is_pick_up = true
	else:
		is_outline = false
		is_pick_up = false


func _on_enter_area_entered(area):
	target_node = area.owner
	if target_node == area.owner:
		is_outline = true
		is_pick_up = true
		player = target_node


func _on_enter_area_exited(area):
	if area.owner == target_node:
		target_node = null
