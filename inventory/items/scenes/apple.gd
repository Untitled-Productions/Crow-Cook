extends Area2D

@onready var Animated = $AnimatedSprite2D
@onready var anim = $AnimationPlayer
@export var itemRes: InventoryItem
@export var is_on_tree: bool


func _process(delta: float) -> void:
	if is_on_tree == true:
		fallfromtree()
		is_on_tree = false

func fallfromtree():
	$CollisionShape2D.disabled = true
	anim.play("fall")
	await get_tree().create_timer(1.5).timeout
	$CollisionShape2D.disabled = false

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()

func _on_area_entered(_area):
	Animated.play("ol")


func _on_area_exited(_area):
	Animated.play("unol")
