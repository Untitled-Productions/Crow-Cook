extends Area2D

@onready var Animated = $AnimatedSprite2D
@export var itemRes: InventoryItem

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()

func _on_area_entered(_area):
	Animated.play("ol")


func _on_area_exited(_area):
	Animated.play("unol")
