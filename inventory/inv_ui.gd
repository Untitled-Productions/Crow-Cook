extends Control

@onready var inv: Inv = preload("res://inventory/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func _ready():
	inv.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].visuals(inv.slots[i])

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if is_open:
			close()
			Global.invop = false
			Global.mouseani.visible = false
		else:
			open()
			Global.invop = true
			Global.mouseani.visible = true

func open():
	self.visible = true
	is_open = true

func close():
	visible = false
	is_open = false
